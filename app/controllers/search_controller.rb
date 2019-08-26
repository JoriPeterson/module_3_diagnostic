class SearchController < ApplicationController
  def index
		render locals: {facade: StationSearchFacade.new(params[:zipcode])}
  end
end
