class StationSearchFacade
	attr_reader :zipcode

	def initialize(zipcode)
		@zipcode = zipcode
		@stations = stations
	end

	def stations
		#make API call
		#parse JSON
		#create objects
	end
end
