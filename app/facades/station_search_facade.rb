class StationSearchFacade
	attr_reader :zipcode

	def initialize(zipcode)
		@zipcode = zipcode
		@stations = stations
	end

	def stations
		#need to change params to limit fuel type!
		conn = Faraday.new('https://developer.nrel.gov') do |f|
			f.headers['X-API-KEY'] = ENV["NREL_KEY"]
			f.adapter Faraday.default_adapter
		end

		response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}")
		search_results = JSON.parse(response.body, symbolize_names: true)
# binding.pry
		search_results[:fuel_stations].map do |result|
			Station.new(result)
		end
	end
end
