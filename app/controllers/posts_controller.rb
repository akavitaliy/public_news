class PostsController < ApplicationController
  def index
    @posts = Post.page params[:page]       
  end

  def topic 
     @topic = Topic.find_by(alias: params[:topic])
     @posts = @topic.posts
     render 'index'
  end

  def show  
    @post = Post.find(params[:id]) 
  end

  def new
    @post = Post.new
    @topics = Topic.order(:title)
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to @post
    else 
      @topics = Topic.all
      render 'new'
    end   
  end

  def edit
    @post = Post.find(params[:id]) 
    @topics = Topic.all
  end

  def update
    @post = Post.find(params[:id]) 
    if @post.update(post_params)
      redirect_to @post
    else 
      @topics = Topic.all
      render 'edit'
    end
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
    params[:post][:topic_id] = params[:post][:topic]
    params.require(:post).permit(:topic_id, :title, :body)
  end
  
  
end
