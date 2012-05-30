class Action
	
	attr_reader :unit, :game

	def initialize(unit, game, x, y)
		@unit = unit
		@game = game
		@x = x
		@y = y
	end

	def call 
		raise NotImplementedError
	end

	def target
		game.map.units[@x, @y]
	end

	def rep
		[self.class.shortname, @x, @y]
	end

	def self.rep
		["Action", self.class.shortname]
	end

	def self.range(unit); 1; end

	def self.target?(unit, other); unit.enemy?(other); end

	def self.generate(unit, game)
		map = game.map 
		near = map.near_positions(range(unit), unit.x, unit.y)
		targets = near.find_all{ |x,y| target?(unit, map.units[x.y]) }
		return targets.collect{ |x,y| self.new(unit, game, x, y) }
	end


end