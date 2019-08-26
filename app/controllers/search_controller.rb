class SearchController < ApplicationController
  def index
		render locals: {facade: StationSearchFacade.new(params[:q])}
  end
end
