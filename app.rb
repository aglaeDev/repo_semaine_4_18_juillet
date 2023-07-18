require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("josé", 10)
player2 = Player.new("Marie", 10)

while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur : "
    player1.show_state
    player2.show_state
    puts "Passons à la phase d'attaque :"
    player1.attack(player2)
    if player2.life_points <= 0
        break
    end
    player2.attack(player1)
end
