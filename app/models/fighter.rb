# Defines a fighter and their stats in battle
class Fighter
  attr_reader :name
  attr_accessor :health, :strength, :accuracy, :number_of_hits, :speed

  def initialize(name)
    # Fighter's name
    @name = name
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

  # Returns true if the fighter is alive
  def alive?
    @health.positive?
  end

  # Returns true if the fighter is dead
  def dead?
    @health.zero?
  end

  # Randomizes strength again, overwritten by child class methods.
  def refresh_strength; end

  # Randomizes number of hits again, overwritten by child class methods.
  def refresh_number_of_hits; end

  # Determines if the hit lands
  def hit_landed?
    miss_chance = rand(0..100)
    @accuracy >= miss_chance
  end
end
