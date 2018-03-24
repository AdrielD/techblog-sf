class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		puts ActiveSupport::Dependencies.autoload_paths
	end

	def create
		@post = Post.new(allowed_params)
		@post.converted_text = convert(@post.markdown_text)

		if @post.save
			MarkdownProcessorWorker.new.perform(@post.id)
			redirect_to @post
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.converted_text = convert(@post.markdown_text)

		if @post.update(allowed_params)
			MarkdownProcessorWorker.new.perform(@post.id)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
	end

	private

	def allowed_params
		params.require(:post).permit(:author_id, :title, :markdown_text)
	end

	def convert(text)
		text.gsub("\n", "<br>")
	end

end