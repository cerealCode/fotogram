class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index 
		@posts = Post.all
	end

	def new
		if @post = Post.new
			flash[:success] = 'Post created!'
		else
			flash.now[:alert] = 'Failed to create post'
			render :new
		end
	end

	def create
    if @post = Post.create(post_params)
    	flash[:success] = 'Post created!'
      redirect_to posts_path
    else
    	flash.now[:alert] = 'Post not created, please try again'
      render :new
    end
  end

	def show
	end

	def edit  
	end 

	def update  
 		if @post.update(post_params)
 			flash[:success] = 'Post updated'
      redirect_to posts_path
    else
    	flash.now[:alert] = 'Cannot update, try again'
      render :edit
    end
	end  

	def destroy
		@post.destroy
		flash[:success] = 'Your post has been deleted'
		redirect_to posts_path
	end


	private

	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
