class PublishingWorker
  include Sidekiq::Worker

  def perform(post_id)
    Post.find(post_id).update_attribute(:publish_status, 1)
  end
end
