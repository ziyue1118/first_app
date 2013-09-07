class PostsController < ApplicationController
	def index
		@posts = Post.all 
	end 
	def new 
		@post = Post.new
	end 
	def create
		@post = Post.new(params[:post].permit(:title, :text))
		if @post.save
			redirect_to action: :show, id: @post.id
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else 
			redirect_to 'edit'
		end

	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
end