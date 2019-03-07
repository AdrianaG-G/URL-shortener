class GetTitleJob < ApplicationJob
  queue_as :default
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  
  def perform(url_id)
    url = UrlShortener.find(url_id)

    page = Nokogiri::HTML(open(url.original_url))   
    puts page.class   # => Nokogiri::HTML::Document
    url.title = page.css("title").text  
    url.save
  end
end
