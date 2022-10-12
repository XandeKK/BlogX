class ArticlesController < ApplicationController
  before_action :set_article, except: :index
  before_action :redirect_if_empty, except: :index

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new tag: Tag.first

    if @article.save
      redirect_to article_path @article
    else
      redirect_to articles_path
    end
  end

  def edit
  end

  def update
    if @article.update article_params
      redirect_to article_path @article
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :content)
  end

  def set_article
    begin
      @article = Article.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @article = nil
    end
  end

  def redirect_if_empty
    redirect_to articles_path if @article.nil?
  end
end
