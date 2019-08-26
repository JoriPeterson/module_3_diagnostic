class SearchController < ApplicationController
  def index
		render locals: {facade: StationSearchFacade.new(zipcode)}
  end
end
