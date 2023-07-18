require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant ici !|"
puts "-------------------------------------------------"

puts "comment tu t'apelle ?"
name_of_human_player = gets.chomp

my_game = Game.new(name_of_human_player)
while my_game.is_still_ongoing?
my_game.menu
puts "Les autres joueurs t'attaquent !"
my_game.enemies_attack
end

my_game.end

