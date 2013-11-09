class ArticlesController < ApplicationController
  respond_to :json

  def index
    @articles = Article.all
    respond_with @articles
  end

  def recent
    TimesWire::Base.api_key = "427be2cf8f9f4c62a6c48296717755bf:14:68384323"
    @items = TimesWire::Item.latest('nyt')

    @tldr = []
    @items.each do |item|
      if item.url.match(/\.html/i)
        response = HTTParty.get(
          "http://clipped.me/algorithm/clippedapi.php?url=#{item.url}"
        )
        @tldr << JSON.parse(response)
      end
    end

    respond_with @tldr
  end
end
