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

    num = rand(1..4)
    p "Num is..."
    p num
    if(num==1) then crawl end
    
  end



  private
  
  def crawl
    p "Private crawl"
    p Time.now
    @newspapers = Newspaper.all
      Newspaper.all.each do |newspaper|
        thisUrl = newspaper.newspaperUrl
        html = URI.open(thisUrl.to_s).read
        header = Nokogiri::HTML(html)
        headers = header.css(newspaper.newspaperCssSelector)
        aValue = headers[0].attribute('href').value
        retrievedArticleHeadline = headers[0].content
        if newspaper.newspaperUrlRelative
          retrievedArticleUrl = thisUrl + aValue
        else
          retrievedArticleUrl = aValue
        end

        @article = Article.new(headline: retrievedArticleHeadline, url: retrievedArticleUrl, newspaper_id: newspaper.id)
        @article.save ? (p 'Article saved!') : (p 'Article not saved. Its already in the db!')
    end

  end
end
