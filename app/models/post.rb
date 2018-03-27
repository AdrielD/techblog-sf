class Post < ApplicationRecord
	belongs_to :user, foreign_key: :author_id
	before_save :convert_text

	validates :title, presence: true

	def delay_publishing(interval_id)
		unless interval_id.eql?("0")
			self.publish_status = 0
			PublishingWorker.perform_at(Scheduler.intervals(interval_id), self.id)
		end
		return self
	end

	private
	def convert_text
		self.converted_text = MarkdownProcessorWorker.new.perform(self.markdown_text)
	end

end
