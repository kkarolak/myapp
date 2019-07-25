class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update]
  before_action :authenticate_user!
  after_action :verify_authorized
  def create
   authorize Comment
   @comment = @article.comments.create(comment_params)
   @comment.user_id = current_user.id
   @comment.status = "unpublished"

   if @comment.save
     flash[:success] = "Udało się dodać komentarz! Poczekaj na zaakceptowanie go przez administratora"
     redirect_to @article
   end

  end
  def set_article
    @article = Article.find(params[:article_id])
  end
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
