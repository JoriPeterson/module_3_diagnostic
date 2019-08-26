class Station
	attr_reader :name, :address, :fuel_types, :distance, :access_times

	def initialize(results = {})
		@name = results[:station_name]
		@address = results[:street_address]
		@fuel_types = results[:fuel_type_code]
		@distance = results[:distance]
		@access_times = results[:access_times]
	end
end
