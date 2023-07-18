require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

my_game = Game.new("Wolverine")

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant ici !|"
puts "-------------------------------------------------"

puts "comment tu t'apelle ?"
name_of_human_player = gets.chomp

my_game.initialize
#while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
my_game.menu_choice
puts "Les autres joueurs t'attaquent !"
my_game.enemies_attack
#end
my_game.end

