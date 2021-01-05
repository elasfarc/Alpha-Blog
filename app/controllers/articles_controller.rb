class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        
    end

    def create

        #@article = Article.new(title: params[:title], description: params[:description])
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_path(@article.id)
        else 
            pp 'error'
            render :new
        end

    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end