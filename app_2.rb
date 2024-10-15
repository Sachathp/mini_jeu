require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "      Bienvenue sur le meilleur jeu du monde !             "          
puts "             Il n'en restera qu'un                     "
puts "-----------------------------------------------------"

puts "Créer ton personnage "
puts  human_name = gets.chomp  
player0 = HumanPlayer.new(human_name)
player1 = Player.new("Josianne")
player2 = Player.new("José") 
ennemies = [player1, player2]

puts "On entre dans la phase de combat"
puts ""


while player0.life_points >0 && (player1.life_points > 0 || player2.life_points > 0) 

    puts player0.show_stats
    puts ""

    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_stats}"
    puts "1 - #{player2.show_stats}" 

    action = gets.chomp 
    
        if action == "a" 
            player0.search_weapon
        else 
            player0.search_health_pack
        end

    target = gets.chomp.to_i

        if target == 0
            player0.attacks(player1)
        else 
            player0.attacks(player2)
        end

    puts "Les autres joueurs t'attaque"
    puts ""

    ennemies.each do |enemy|
        if enemy.life_points > 0 
            enemy.attacks(player0)
        end
    end
end

 if player0.life_points > 0
    puts "Bravo tu as gagné"
 else puts "T'as perdu gros noob"
 end
