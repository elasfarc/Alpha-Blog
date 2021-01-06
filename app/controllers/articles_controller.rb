class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create

        #@article = Article.new(title: params[:title], description: params[:description])
        @article = Article.new(article_params)
        
        if @article.save
            flash[:notice] = 'Article was successfully saved!'
            redirect_to article_path(@article.id)
        else 
            render :new
        end

    end

    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        if @article.save 
            flash[:notice] = 'Article was updated'
            redirect_to article_path(@article.id)
        else
            render :edit
        end
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end