class PublishingWorker
  include Sidekiq::Worker

  def perform(post_id)
    Post.find(post_id).update_attribute(:publish_status, 1)
    ActionCable.server.broadcast "delayed_publishing_channel", message: "A new post is available"
  end
end
