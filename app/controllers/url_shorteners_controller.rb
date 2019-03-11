# frozen_string_literal: true

class UrlShortenersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @url = UrlShortener.new
    list_top_100
  end

  def create
    @url = UrlShortener.new
    @url.original_url = params[:original_url]
    if @url.url_not_saved?
      if @url.save
        GetTitleJob.perform_later @url.id
        add_short_url(@url.id)

        flash[:success] = 'URL shortened correctly.'
        @url = UrlShortener.find(@url.id)
        redirect_to show_short_url_path(@url.short_url)
      else
        flash.now[:error] = 'Sorry, the URL could not be generated.'
        render 'index'
      end
    else
      redirect_to show_short_url_path(@url.find_duplicate.short_url)
    end
  end

  def find_original_url
    url = UrlShortener.find_by_short_url(params[:short_url])
    # Increment it on each page view
    url.increment!(:visits)
    redirect_to url.original_url
  end

  def show_short_url
    # Returns a \host:\port string for this request
    host = request.host_with_port
    @url = UrlShortener.find_by_short_url(params[:short_url])
    @original_url = @url.original_url
    @short_url = "#{host}/#{@url.short_url}"
  end

  def list_top_100
    @urls = UrlShortener.order('visits DESC').limit(100)
  end

  def add_short_url(url_id)
    url = UrlShortener.find(url_id)
    url.short_url = url.generate_short_url(url_id)
    url.save
  end
end
