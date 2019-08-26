class NrelService

	def initialize(zipcode)
		@zipcode = zipcode
	end

	def stations_by_zip
		conn = Faraday.new('https://developer.nrel.gov') do |f|
			f.headers['X-API-KEY'] = ENV["NREL_KEY"]
			f.adapter Faraday.default_adapter
		end

		response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zipcode}&fuel_type=ELEC,LPG&limit=10")
		JSON.parse(response.body, symbolize_names: true)
	end

	private

	def get_json(url)
		response = conn.get(url)
		JSON.parse(response.body, symbolize_names: true)
	end
end
