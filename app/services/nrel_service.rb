class NrelService

	def initialize(zipcode)
		@zipcode = zipcode
	end

	def stations_by_zip
		get_json("/api/alt-fuel-stations/v1/nearest.json?location=#{@zipcode}&fuel_type=ELEC,LPG&limit=10")
	end

	private

	def conn
		Faraday.new('https://developer.nrel.gov') do |f|
			f.headers['X-API-KEY'] = ENV["NREL_KEY"]
			f.adapter Faraday.default_adapter
		end
	end

	def get_json(url)
		response = conn.get(url)
		JSON.parse(response.body, symbolize_names: true)
	end
end
