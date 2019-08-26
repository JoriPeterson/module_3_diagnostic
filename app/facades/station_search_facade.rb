class StationSearchFacade
	attr_reader :zipcode

	def initialize(zipcode)
		@zipcode = zipcode
		@stations = stations
	end

	def stations

		conn = Faraday.new('https://developer.nrel.gov') do |f|
			f.headers['X-API-KEY'] = ENV["NREL_KEY"]
			f.adapter Faraday.default_adapter
		end

		response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=80203")
		search_results = JSON.parse(response.body, symbolize_names: true)
binding.pry
		search_results.map do |result|
			Station.new(result)
		end
	end
end
