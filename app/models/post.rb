class Post < ApplicationRecord
	belongs_to :user, foreign_key: :author_id
	before_save :convert_text

	validates :title, presence: true

	def delay_publishing(due_string)
		self.publish_status = 0
		PublishingWorker.perform_at(eval(due_string).from_now, self.id)
		return self
	end

	private
	def convert_text
		self.converted_text = MarkdownProcessorWorker.new.perform(self.markdown_text)
	end

end
