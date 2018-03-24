class MarkdownConversionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "markdown_conversion_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def convert(data)
  	MarkdownProcessorWorker.new.perform(data['message'])
  end
end
