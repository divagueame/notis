class ArticlesController < ApplicationController
  def show
    showDay = Time.now - params[:date].to_i.day
    @articles = []
    Article.find_each do |article|
      if article.created_at.strftime("%F") == showDay.strftime("%F") then
        @articles.push article
      end
    end
      
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
