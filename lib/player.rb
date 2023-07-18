class Player
    attr_accessor :name, :life_points

    def initialize(name, life_points)
        @name = name
        @life_points = life_points 
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie."
    end
     
    def gets_damage(number)
        @life_points -= number
        if @life_points<= 0
            puts "le joueur #{@name} a été tué !"
        end
    end 

    def attack(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}"
        damage = compute_damage
        player.gets_damage(damage)
        puts "il lui inflige #{damage} points de dommages"
    end

    def compute_damage
        return rand(1..6)
        end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et à une arme de niveau #{@weapon_level}."
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = new_weapon
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        more_life = rand(1..6)
        if more_life == 1
            puts "Tu n'as rien trouvé... "
        elsif more_life >= 2 && more_life <= 5
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else 
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
        if @life_points > 100 
            @life_points = 100
        end
    end

end
