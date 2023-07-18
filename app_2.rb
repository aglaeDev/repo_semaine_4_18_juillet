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

user = HumanPlayer.new(name_of_human_player)
player1 = Player.new("josé", 10)
player2 = Player.new("Marie", 10)

ennemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
    puts "Voici votre état"
    user.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    print "0 - " 
    print "#{player1.show_state}"
    print "1 - " 
    print "#{player2.show_state}"
    choice = gets.chomp
    if choice == "a" 
        user.search_weapon
    elsif choice == "s"
        user.search_health_pack
    elsif choice == "0"
        user.attack(player1)
    elsif choice ==  "1"
        user.attack(player2)
    else
        puts "mauvaise option"
    end
    puts "Les autres joueurs t'attaquent !"

    ennemies.each do |player|
        if player.life_points > 0
            player.attack(user)
        end
    end

end

puts "La partie est finie"

if user.life_points <=0 
    puts "Loser ! Tu as perdu !"
else
    puts "BRAVO ! TU AS GAGNE !"
end



