class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  def create
    authorize User
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.status = "unpublished"

    if @comment.save
      flash[:success] = "Comment was added!"
      redirect_to admin_article_path(@article)

    else
      flash[:success] = "Comment was not added"
      redirect_to admin_article_path(@article)
    end
  end
  def update
    authorize User
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:article_id])
    if @comment.status == "published"
      @comment.update(status: "unpublished")
      flash[:success] = "Comment was published"
      redirect_to request.referrer
    else
      @comment.update(status: "published")
      flash[:success] = "Comment was unpublished"
      redirect_to request.referrer
    end
  end
  def edit
  end
  def destroy
    authorize User
    @comment = Comment.find(params[:article_id])
    @comment.destroy
    flash[:success] = "Comment was deleted"
    redirect_to request.referrer
  end
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end