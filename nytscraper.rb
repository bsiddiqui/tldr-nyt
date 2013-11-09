require "times_wire"
require 'unirest'
# require "nokogiri"
# require "open-uri"
# require 'embedly'
# require 'json'
require "pry"

TimesWire::Base.api_key = "427be2cf8f9f4c62a6c48296717755bf:14:68384323"
@items = TimesWire::Item.latest('nyt')

response = Unirest::post("https://textteaser.p.mashape.com/api",
  {
    "X-Mashape-Authorization" => "CmbaFEBCNBzPBZcPk21r6cwd79PbXv9y"
  },
  {
    url: "http://www.nytimes.com/2013/11/09/world/africa/blast-hits-hotel-in-somalia.html"
  }
)

binding.pry
