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
