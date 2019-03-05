class UrlShortenersController < ApplicationController
  def index
  end

  def create
    @url = UrlShortener.new
    puts "Enter the URL you want to shorten"
    @url.original_url = gets.chomp
    if @url.save
      puts "New URL generated correctly."
    else
      puts "Sorry, we had problems generating the URL. Try again."
    end
  end
end
