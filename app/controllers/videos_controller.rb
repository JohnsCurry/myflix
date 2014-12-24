class VideosController < ApplicationController

  def index
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end

  def home
    @categories = Category.all
  end
end
