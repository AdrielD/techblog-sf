class Post < ApplicationRecord
	belongs_to :user, foreign_key: :author_id
	before_save :convert_text

	validates :title, presence: true 

	private
	def convert_text
		self.converted_text = MarkdownProcessorWorker.new.perform(self.markdown_text)
	end
end