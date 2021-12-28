class ApplicationController < ActionController::Base
  def index
    p "Aplication index"
    params
    showDay = Time.now - params[:date].to_i.day
    @articles = []
    Article.find_each do |article|
      if article.created_at.strftime("%F") == showDay.strftime("%F") then
        @articles.push article
      end
    end
  end
end
