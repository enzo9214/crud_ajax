class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end  

  def create
    @post_create = Post.new(post_params)

    respond_to do |format|
      if @post_create.save 
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.destroy
        format.js
      end
    end  
  end  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title)
    end
end
