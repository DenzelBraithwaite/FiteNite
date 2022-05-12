require_relative 'fighter'

class Warrior < Fighter
  def initialize(name)
    super
    @health = 110
    @strength = rand(15..25)
    @accuracy = 75
    @number_of_hits = 2
    @speed = 2
  end

  def refresh_strength
    @strength = rand(15..25)
  end

  def refresh_number_of_hits
    @number_of_hits = 2
  end
end
