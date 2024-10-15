require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("José")
player_2 = Player.new("Josianne")

puts "Voici l'état de chaque joueurs :"
puts ""
puts player_1.show_stats
puts player_2.show_stats
puts ""
puts "Passons à la phase d'attaque :"
puts ""
while  player_1.life_points > 0 && player_2.life_points > 0
 player_1.attacks(player_2)
    break if player_2.life_points <= 0
 player_2.attacks(player_1)
    break if player_1.life_points <= 0
puts ""
end

#binding.pry