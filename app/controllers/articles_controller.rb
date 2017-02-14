class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @kram = Kramdown::Document.new(@article.content).to_html.html_safe
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to articles_path
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    # params[:task] == params.require(:task)
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
