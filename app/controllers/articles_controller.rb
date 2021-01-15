# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show update edit destroy]
  def show; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)

  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(title: params[:title], description: params[:description])
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was successfully saved!'
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    @article.update(article_params)
    if @article.save
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = 'Article was deleted!'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
