require_relative 'fighter'

class Balanced < Fighter
  def initialize(name)
    super
    @strength = 20
    @accuracy = 90
    @speed = 3
  end

  def refresh_strength
    @strength = 20
  end

  def refresh_number_of_hits
    @number_of_hits = 1
  end
end
