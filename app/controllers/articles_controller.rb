class ArticlesController < ApplicationController

  def index_template
    respond_to do |format|
      format.html do
        render :index
      end
    end
  end

  def index
    respond_to do |format|
      format.json do
        @articles = Article.all
        render json: @articles
      end
    end
  end

  def recent
    respond_to do |format|
      format.json do
        @articles = Article.limit(20).all
        render json: @articles
      end
    end
  end

  def get_recent
    respond_to do |format|
      format.json do
        TimesWire::Base.api_key = "427be2cf8f9f4c62a6c48296717755bf:14:68384323"
        @items = TimesWire::Item.section('nyt', 'world')

        @tldr = []
        @items.each do |item|
          if item.url.match(/\.html/i)
            puts item
            response = HTTParty.get(
              "http://clipped.me/algorithm/clippedapi.php?url=#{item.url}"
            )
            response = JSON.parse(response)
            unless Article.where(
              title: response["title"],
              source: response["source"],
              url: item.url
            ).first
              Article.create(
                title: response["title"],
                source: response["source"],
                data: { summary: response["summary"] },
                url: item.url
              )
            end
          end
        end
        render json: @articles
      end
    end
  end
end
