require "rails_helper"

RSpec.describe PostsController, type: :request do
	before(:context) do
		@author = User.create(name: "John", email: "a@a.com", password: "abc123", password_confirmation: "abc123")
		Post.create(title: "Test", markdown_text: "Hello, this is me!", author_id: @author.id)
		Post.create(title: "Test 2", markdown_text: "Hello again, this is me indeed!", author_id: @author.id)
		Post.create(title: "Test 3", markdown_text: "Oh, hi!", author_id: @author.id)
		Post.create(title: "Test 4", markdown_text: "Cool...", author_id: @author.id)
		Post.create(title: "Test 5", markdown_text: "By the way...", author_id: @author.id)
	end

	context "when accessed by public" do
		it "lists all posts" do
			get posts_path
			expect(response).to have_http_status(:ok)
		end

		it "show an specific post" do
			post = Post.first
			get post_path(post.id)
			expect(response).to have_http_status(:ok)
		end

		it "denies access to new" do
			get new_post_path
			expect(response).to redirect_to root_path
		end

		it "denies access to create" do
			post_attributes = { title: "Guest post", markdown_text: "Sneaky post creation...", author_id: 1 }
			expect {
				post "/posts", params: { post: post_attributes }
			}.to_not change(Post, :count)
		end

		it "denies access to edit" do
			get new_post_path
			expect(response).to redirect_to root_path
		end

		it "denies access to update" do
			post = Post.first
			expect {
				put "/posts/#{post.id}", params: { post: { title: "Sneaky title change" } }
			}.to_not change(post, :updated_at)
		end
	end

	context "when accessed by author" do
		before(:each) do
	    get "/login", params: { email: "a@a.com", password: "abc123" }
	  end

		it "lists all posts" do
			get posts_path
			expect(response).to have_http_status(:ok)
		end

		it "show an specific post" do
			post = Post.first
			get post_path(post.id)
			expect(response).to have_http_status(:ok)
		end

		it "allows access to new" do
			get new_post_path
			expect(response).to have_http_status(:ok)
		end

		it "allows post creation" do
			post_attributes = { title: "Guest post", markdown_text: "Sneaky post creation...", author_id: @author.id }
			expect {
				post "/posts", params: { post: post_attributes }
			}.to change(Post, :count)
		end

		it "allows access to edit" do
			get new_post_path
			expect(response).to have_http_status(:ok)
		end

		it "allows post update" do
			post = Post.first
			expect {
				put "/posts/#{post.id}", params: { post: { title: "A real title change" } }
			}.to_not change(post, :updated_at)
		end
	end
end
