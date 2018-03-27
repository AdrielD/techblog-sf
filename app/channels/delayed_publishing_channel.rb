class DelayedPublishingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "delayed_publishing_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
