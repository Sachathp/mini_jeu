require 'pry'

class Player 
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name.to_s
        @life_points = 10 
    end

    def show_stats
        return "#{name} à #{life_points} points de vie"
    end

    def gets_damage(i)
        @life_points -= i
        if @life_points <= 0 
            puts "Le joueur #{name} à été tué"
        else 
            puts "#{name} à #{life_points} points de vie"
        end
        return @life_points
    end

    def attacks (player_attacked)
         damage = compute_damage 
         puts "#{@name} attaque #{player_attacked.name}"
         puts "Il lui inflige #{damage} points de dommages"
         player_attacked.gets_damage(damage)
         
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player 
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100 
        @weapon_level = 1 
    end

    def show_stats
        return "#{name} à #{life_points}points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon 
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
            if new_weapon > @weapon_level
                @weapon_level = new_weapon
                puts "GG, ton armes est maintenant au niveau #{weapon_level}"
            else puts "RIP c'est de la merde"
         end
    end

    def search_health_pack 
        
        health_pack = rand(1..6)
        if health_pack == 1 
            puts "#{name} attaque trempête, rien ne se passe"
        elsif health_pack == 6 
            @life_points += 80 
            @life_points = 100 if @life_points > 100
            puts "GG t'es le boss +80hp, tu as maintenant #{@life_points} points de vie"
        else @life_points +=50 
            @life_points = 100 if @life_points > 100
            puts "Peux mieux faire, +50hp, tu as maintenant #{@life_points} points de vie"
        end
    end


end





