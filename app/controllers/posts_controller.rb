class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to action: 'index'
  end
  
  private
    def post_params #ストロングパラメータ
      params.require(:post).permit(:text) #パラメーターのキー
    end
end
