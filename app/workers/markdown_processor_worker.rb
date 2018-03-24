class MarkdownProcessorWorker
  include Sidekiq::Worker

  def perform(text)
  	ActionCable.server.broadcast "markdown_conversion_channel", message: convert(text)
  end

  private

  def convert(text)
  	text.gsub("\n", "<br>").upcase
  end
end
