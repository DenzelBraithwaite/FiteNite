require_relative 'fighter'

class Warrior < Fighter
  def initialize
    super
    @health = 150
    @strength = rand(20..25)
    @accuracy = 75
    @number_of_hits = rand(1..2)
    @speed = 2
  end

  def refresh_strength
    @strength = rand(15..25)
  end

  def refresh_number_of_hits
    @number_of_hits = rand(1..2)
  end
end
