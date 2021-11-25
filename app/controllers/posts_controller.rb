class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def show  
    @post = Post.find(params[:id]) 
  end

  def new
    @post = Post.new
    @topics = Topic.all #.order(:title)
  end

  def create
    @post = Post.new(post_params)
    @post.save 
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id]) 
    @topics = Topic.all
  end

  def update
    @post = Post.find(params[:id]) 
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id]) 
    @post.destroy
    redirect_to posts_index_path
  end  

  private

  def set_post
    
  end

  def post_params
    params.require(:post).permit(:topic_id, :title, :body)
  end
  
  
end
