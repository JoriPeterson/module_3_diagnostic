class Station
	attr_reader :name, :address, :distance, :

	def initialize(results = {})
		@name = results[:station_name]
		@address = results[:street_address]
		@distance = results[:distance]
		@access_times = results[:access_times]
	end
end
