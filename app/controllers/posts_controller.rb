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
    
  end

  def update
    
  end

  def destroy
    
  end  

  private

  def set_post
    
  end

  def post_params
    params.require(:post).permit(:topic_id, :title, :body)
  end
  
  
end
