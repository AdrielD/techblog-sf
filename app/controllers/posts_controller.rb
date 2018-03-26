class PostsController < ApplicationController
	before_action :verify_authentication, except: [:index, :show]
	
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(allowed_params)

		if @post.save
			redirect_to @post, notice: 'Post created!'
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(allowed_params)
			redirect_to @post, notice: 'Post updated!'
		else
			render :edit
		end
	end

	private

	def allowed_params
		params.require(:post).permit(:author_id, :title, :markdown_text)
	end
end