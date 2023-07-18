class Game
    attr_accessor :human_player, :ennemies

    def initialize(name)
        player1 = Player.new("josé", 10)
        player2 = Player.new("Marie", 10)
        player3 = Player.new("joseanne", 10)
        player4 = Player.new("lou", 10)
        @ennemies = [player1, player2, player3, player4]
        @human_player = HumanPlayer.new(name)
    end
    
    def kill_player(player)
       @ennemies.delete(player)
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && @ennemies.length > 0
            return true
        else
            return false
        end
    end

    def show_players
        @human_player.show_state
        puts "il reste #{@ennemies.length} ennemies"
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "attaquer un joueur en vue :"
        @ennemies.each do |player|
       print "#{@ennemies.index(player)} -"
       print "#{player.show_state}"
        end
        choice = gets.chomp
        menu_choice(choice)
    end

    def menu_choice(choice)
        if choice == "a" 
            @human_player.search_weapon
        elsif choice == "s"
            @human_player.search_health_pack
        else
            @human_player.attack(@ennemies[choice.to_i]) 
            if @ennemies[choice.to_i].life_points <= 0
                kill_player(@ennemies[choice.to_i])
            end
        end
    end

    def enemies_attack
        @ennemies.each do |player|
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