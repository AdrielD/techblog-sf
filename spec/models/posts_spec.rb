require "rails_helper"

RSpec.describe Post, type: :model do
	before(:context) do
		@author = User.create(name: "John", email: "a@a.com", password: "abc123", password_confirmation: "abc123")
		@post = Post.new(title: "Test", markdown_text: "Hello, this is me", author_id: @author.id)
	end

  context "when created" do
    it "must have an author" do
      expect(@post.save).to be true
    end

    it "must have a title" do
      expect(@post.save).to be true
    end

    it "should have converted text" do
    	@post.save
      expect(@post.converted_text).not_to eq(nil) 
    end
  end
end