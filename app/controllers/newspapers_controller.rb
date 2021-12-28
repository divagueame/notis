class NewspapersController < ApplicationController
  before_action :set_newspaper, only: %i[show edit update destroy]

  # GET /newspapers or /newspapers.json
  def index
    
    @newspapers = Newspaper.all
    
  end

  # GET /newspapers/1 or /newspapers/1.json
  def show
    @newspaper = Newspaper.find(params[:id])
  end

  # GET /newspapers/new
  def new
    @newspaper = Newspaper.new
  end

  def create
     p 'Create! '
    @newspaper = Newspaper.new(newspaper_params)

    if @newspaper.save
      redirect_to @newspaper
    else
      render :new
    end
  end

  def edit
    @newspaper = Newspaper.find(params[:id])
  end

  def update
    @newspaper = Newspaper.find(params[:id])

    if @newspaper.update(newspaper_params)
      redirect_to @newspaper
    else
      render :edit
    end
  end

  def destroy
    @newspaper = Newspaper.find(params[:id])
    @newspaper.destroy

    redirect_to root_path
  end

  def crawl
    p "BUG! In newspaper controller Crawl was called!"
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_newspaper
    @newspaper = Newspaper.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def newspaper_params
    params.require(:newspaper).permit(:newspaperName, :newspaperUrl, :newspaperCssSelector, :newspaperUrlRelative)
  end
end
