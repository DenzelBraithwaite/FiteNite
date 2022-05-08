# Defines a fighter and their stats in battle
class Fighter
  attr_reader :name
  attr_accessor :health, :strength, :accuracy, :number_of_hits, :speed

  def initialize(stats = {})
    # Fighter's name
    # @name = stats[:name]
    # How many hitpoints the fighter has until knocked out.
    @health = 100
    # How much damage does the fighter do.
    @strength = 10
    # Chance of hitting or missing the target.
    @accuracy = 100
    # How many times the fighter will hit in one turn.
    @number_of_hits = 1
    # The higher the speed, the more likely to hit first.
    @speed = 1
  end

  def alive?
    @health.positive?
  end

  def dead?
    @health.zero?
  end

  # Each fighter will need a method to randomize their damage each time!!!!!!!!!!!!!!
  def attack
    hits_landed = 0
    @number_of_hits.times do
      hits_landed += 1 if hit_landed?
    end
    puts "#{@name} hit #{hits_landed} time(s)"
    @strength
  end

  # Determines if the hit lands
  def hit_landed?
    miss_chance = rand(0..100)
    self.accuracy >= miss_chance
  end
end
