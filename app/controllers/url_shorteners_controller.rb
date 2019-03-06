class UrlShortenersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    @url = UrlShortener.new
    @url.original_url = params[:original_url]
    if @url.save
      puts "New URL generated correctly."
      render 'index'
    else
      puts "Sorry, we had problems generating the URL. Try again."
      render 'index'
    end
  end

end
