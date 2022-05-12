require_relative 'fighter'

class Assassin < Fighter
  def initialize(name)
    super
    @health = 90
    @strength = rand(20..30)
    @accuracy = 60
    @number_of_hits = rand(2..4)
    @speed = 4
  end

  def refresh_strength
    @strength = rand(15..20)
  end

  def refresh_number_of_hits
    @number_of_hits = rand(2..4)
  end
end
