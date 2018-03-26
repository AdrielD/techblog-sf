require "rails_helper"

RSpec.describe User, type: :model do
	before(:context) do
		@author = User.new(name: "John", email: "a@a.com", password: "abc123", password_confirmation: "abc123")
	end

	context "when created" do
		it "must have an email" do 
			expect(@author.save).to be true
		end

		it "must have a password" do 
			expect(@author.save).to be true
		end

		it "must have a password confirmation that matches password" do 
			expect(@author.save).to be true
		end

		it "must have a password digest" do 
			expect(@author.password).not_to be nil
		end
	end
end