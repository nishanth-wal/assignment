class PostsController < ApplicationController
	before_action :authenticate_users!, except: %i[index]
	before_action :find_post, only: %i[show destroy update]
	def index 
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			render :show, status: :created
		else
			render json: { msg: 'Try again' }, status: :unprocessable_entity
		end
	end

	def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
  	@post.destroy
  end

	private

	def post_params
		params.require(:post).permit(:title, :url)
	end

	def find_post
   @post = current_user.posts.where(id: params[:id]).first
 
   render(json: { msg: 'unauthorized' }, status: :unauthorized) && return unless @post
  end

end