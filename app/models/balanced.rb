require_relative 'fighter'

class Balanced < Fighter
  def initialize(name)
    super
    @health = 110
    @strength = rand(30..40)
    @accuracy = 95
    @speed = 3
  end

  def refresh_strength
    @strength = rand(18..22)
  end

  def refresh_number_of_hits
    @number_of_hits = 1
  end
end
