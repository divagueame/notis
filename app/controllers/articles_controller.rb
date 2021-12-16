class ArticlesController < ApplicationController
  def show
    p "Show"
    p Article.all
    
    # @newspaper = Newspaper.find(params[:newspaper_id])
    # @article = @newspaper.articles.create(article_params)
    
  end

  def create
    @newspaper = Newspaper.find(params[:newspaper_id])
    @article = @newspaper.articles.create(article_params)
    redirect_to newspaper_path(@newspaper)
  end

  private
    def article_params
      params.require(:article).permit(:url, :headline)
    end
end
