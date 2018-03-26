class MarkdownProcessorWorker
  include Sidekiq::Worker

  def perform(text)
    convert(text)
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
