require 'rails_helper'
RSpec.describe MarkdownProcessorWorker, type: :worker do
  it "converts markdown text to HTML" do
  	text = File.read("#{Rails.root.to_s}/spec/markdown_test_file.txt")
  	html_converted = MarkdownProcessorWorker.new.perform(text)
  	expect(html_converted).to match("<h1>Welcome to my new vlog!</h1>")
  	expect(html_converted).to match("<h2>Techblog 2.0</h2>")
  	expect(html_converted).to match("<a href=\"http://rubyonrails.org/\">Ruby on Rails</a>")
  end
end
