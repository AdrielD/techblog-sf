class PostsController < ApplicationController
	before_action :verify_authentication, except: [:index, :show]
	
	def index
		@posts = Post.where("publish_status = 1")
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(allowed_params)
		@post.author_id = @current_user.id

		if @post.delay_publishing(params[:schedule]).save
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

		if params[:schedule].eql?("0") && @post.update(allowed_params)
			redirect_to @post, notice: 'Post updated!'
		elsif @post.delay_publishing(params[:schedule]).update(allowed_params)
			redirect_to root_url, notice: 'Post update scheduled!'
		else
			render :edit
		end
	end

	private

	def allowed_params
		params.require(:post).permit(:author_id, :title, :markdown_text, :schedule)
	end
end