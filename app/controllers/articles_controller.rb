class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
 
  def create
    # @article = Article.new(params.require(:article).permit(:title, :description)) ## Created article_params in private to make dry code. Refactored in line below
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      # redirect_to article_path(@article) 
      redirect_to @article #shorthand redirect, same as above
    else
      render 'new'
    end
  end

  def show
    # @article = Article.find(params[:id]) ## Line removed because of the partial we added on the top of the page
  end

  def edit
    # @article = Article.find(params[:id]) ## Line removed because of the partial we added on the top of the page
  end

  def update
    # @article = Article.find(params[:id]) ## Line removed because of the partial we added on the top of the page
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find(params[:id]) ## Line removed because of the partial we added on the top of the page
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
