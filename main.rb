Dir["classes/*.rb"].each { |file| require file }
FAKERUN = true


#instance vars
terrain_key = {
	'f' => Terrain.new("Forest"),
	'g' => Terrain.new("Grass"),
	'm' => Terrain.new("Mountains"),
	'p' => Terrain.new("Plains"),
	'w' => Terrain.new("Water"),
}


if FAKERUN == true

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

	# init fake game classes
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
	player.game.map.place(0, 0, dixie)
	player.game.map.move(0, 0, 1, 0)

	trex = TRex.new(player, "Johan")
	puts trex.rep
end
