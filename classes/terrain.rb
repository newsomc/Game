class Terrain
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def rep
		[@name]
	end
end


