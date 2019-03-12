# frozen_string_literal: true

class Api::V1::UrlShortenersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @url = UrlShortener.new
    render json: list_top_100
  end

  def create
    @url = UrlShortener.new(list_params)
    p list_params
    if @url.url_not_saved?
      if @url.save
        GetTitleJob.perform_later @url.id
        add_short_url(@url.id)
        @url = UrlShortener.find(@url.id)
        render json: @url, status: :created
      else
        render json: @url.errors, status: :unprocessable_entity
      end
    else
      render json: @url.find_duplicate, status: :exist
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

  private
  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:url).permit(:id, :original_url)
  end
end
