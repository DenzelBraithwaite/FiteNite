require_relative 'fighter'

class Tank < Fighter
  def initialize
    super
    @strength = 20
    @health = 200
  end

  def refresh_strength
    @strength = 15
  end

  def refresh_number_of_hits
    @number_of_hits = 1
  end
end
