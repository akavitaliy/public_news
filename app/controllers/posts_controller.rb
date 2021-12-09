class PostsController < ApplicationController
  def index
    page_token = params.has_key?(:older) ? params[:older] : params[:newer]   
    
    paginate(page_token)

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
  
  def paginate(page_token, topic_id = nil)
    pagination = Services::Pagination.new(page_token, topic_id)

    if page_token.present?
      if params.has_key?(:newer)
        @posts = pagination.newer
      else 
        @posts = pagination.older
      end  
    else 
      @posts = pagination.first_page
    end

    @has_newer = pagination.has_newer
    @has_older = pagination.has_older

    @page_token = pagination.construct_page_token
  end
end
