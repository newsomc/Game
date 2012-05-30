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

	def rep
		[self.class.shortname, name]
	end

	def move_choices 
		map = @player.game.map 
		all = map.all_positions
		near = all.find_all { |x, y| map.within?(@movement, @x, @y, x, y) }
		valid = near.find_all { |x, y|  map.units[x,y].nil? }
		return valid.collect do |x, y|
			Choice.new("Move", x, y) { self.move(x, y) }
		end
	end

	def action_choices
		return acctions.collect do |action|
			Choice.new(*action.rep) { action }
		end
	end
end

class Class
	def shortname
		name().gsub(/^.*:/, '')
	end
end