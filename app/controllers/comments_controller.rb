class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update]
  def create
   @comment = @article.comments.create(comment_params)
   @comment.user_id = current_user.id
   @comment.status = "unpublished"

   if @comment.save
     flash[:success] = "Udało się dodać komentarz! Poczekaj na zaakceptowanie go przez administratora"
     redirect_to @article

  else
   redirect_to root_path
     end
  end
  def update
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
  def set_article
    @article = Article.find(params[:article_id])
  end
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
