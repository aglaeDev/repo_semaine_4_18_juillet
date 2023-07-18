class Game
    attr_accessor :human_player, :ennemies

    def initialize(name)
        @ennemies = 4
        @human_player = name
    end
    

    def kill_player
        @ennemies -= 1
    end

    def is_still_ongoing?(bool)
        if @human_player.life_points > 0 && @ennemies > 0
            bool = true
            puts "#{bool.to_s}"
        end
    end

    def show_players
        puts "#{@human_player} a #{@life_points} points de vie et à une arme de niveau #{@weapon_level}."
        puts "il reste #{@ennemies} ennemies"
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "attaquer un joueur en vue :"
        @ennemies.each do |n_of_ennemies|
        print "#{n_of_ennemies} - " 
       # print "#{player{n_of_ennemies}.show_state}"
        end
    end

    def menu_choice
        choice = gets.chomp
        if choice == "a" 
            user.search_weapon
        elsif choice == "s"
            user.search_health_pack
=beginelsif choice == "#{n_of_ennemies}"
            user.attack(player1) 
=end
        else
            puts "mauvaise option"
        end
    end

    def enemies_attack
        ennemies.each do |player|
            if player.life_points > 0
                player.attack(@human_player)
            end
        end
    end

    def end
        puts "La partie est finie"
        if @human_player.life_points <=0 
            puts "Loser ! Tu as perdu !"
        else
            puts "BRAVO ! TU AS GAGNE !"
        end
    end
end