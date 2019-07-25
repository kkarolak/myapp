class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,]
  before_action :authenticate_user!
  after_action :verify_authorized
  def new
    if current_user
       @article = Article.new
    else
      redirect_to articles_path
    end
  end
  def show
    authorize Article
    @comment = Comment.new
    @comments = @article.comments
  end
  def index
    authorize Article
    @article = Article.all
  end
  def set_article
    @article = Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
end
