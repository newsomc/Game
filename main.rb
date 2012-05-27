Dir["classes/*.rb"].each {|file| require file }

class Human < Unit; end
class Soldier < Unit; end
class Doctor < Unit; end

class Dinosaur < Unit; end
class VRaptor < Unit; end
class TRex < Unit; end

# stub classes
class FakeGame
	attr_accessor :map 
end

class FakePlayer 
	attr_accessor :game
end

#instance vars
terrain_key = {
	'f' => Terrain.new("Forest"),
	'g' => Terrain.new("Grass"),
	'm' => Terrain.new("Mountains"),
	'p' => Terrain.new("Plains"),
	'w' => Terrain.new("Water"),
}

# Let's try!!
player = FakePlayer.new
player.game = FakeGame.new
player.game.map = Map.new terrain_key, <<-END 
	gggggggggg
	gggggggwww
	ggggggwwff
	gggppppppp
	ggppggwfpf
	ggpgggwwff
END

dixie = Unit.new(player, "Dixie")
player.game.map.place(dixie, 0, 0)
dixie.move(1, 0)