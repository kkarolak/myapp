class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def new
    @article = Article.new
  end
  def create
    #render plain: current_user.id
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:success] = "Article was successfully created!"
      redirect_to admin_articles_path
    else
      render 'new'
    end
  end
  def show
    @comment = Comment.new
    @comments = @article.comments
  end
  def edit

  end
  def update
    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to admin_articles_path
    else
      flash[:success] = "Article was not updated"
      render 'edit'
    end
  end
  def index
    @article = Article.all
  end
  def destroy
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to admin_articles_path
  end
  def set_article
    @article = Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title,:description)
  end
end