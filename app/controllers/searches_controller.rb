class SearchesController < ApplicationController
  def index
    @all_searches = Search.all
    @keyword = params[:keyword]
    @matching_searches = Search.where('query LIKE ?', "%#{@keyword}%") if @keyword.present?
  end
  
  def create
    @search = Search.new(search_params)

    if @search.save
      redirect_to searches_path, notice: 'Search was successfully created.'
    else
      render :index
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
