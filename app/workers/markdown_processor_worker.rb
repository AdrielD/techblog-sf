class MarkdownProcessorWorker
  include Sidekiq::Worker

  def perform(post_id)
  	post = Post.find(post_id)
  	post.converted_text = convert(post.markdown_text)
  	post.save
  end

  def perform_broadcast(text)
  	ActionCable.server.broadcast "markdown_conversion_channel", message: convert(text)
  end

  private

  def convert(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    markdown.render(text)
  end
end
