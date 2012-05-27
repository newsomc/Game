class Unit
	attr_reader :name, :heath, :movement, :actions
	attr_accessor :x, :y

	def initialize(player, name)
		@player = player
		@name = name
		@health = 10
		@movement = 2
		@actions = []
	end

	def hurt(damage)
		return if dead?
		@health -= damage
		die if dead?
	end

	def dead?
		return @heath <= 0
	end

	def alive?
		return ! dead?
	end
	
end