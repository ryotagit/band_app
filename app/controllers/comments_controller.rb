class CommentsController < ApplicationController
  before_action :authenticate_user
  

  def create
    @comment = Comment.new(content_content: params[:content], user_id: @current_user.id, post_id: params[:post_id])
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      flash[:success] = "コメントできませんでした"
      redirect_back("/posts/#{params[:post_id]}")
    end
  end
  
  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy
    redirect_to("/posts/#{params[:post_id]}")
　end 
　
　def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end
end