class StationSearchFacade
	attr_reader :zipcode

	def initialize(zipcode)
		@zipcode = zipcode
	end

	def stations
		services.stations_by_zip[:fuel_stations].map do |result|
			Station.new(result)
		end
	end

	private

	def services
		@_services ||= NrelService.new(zipcode)
	end
end
