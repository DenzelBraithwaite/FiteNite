require_relative 'fighter'

class Balanced < Fighter
  def initialize
    super
  end

  def refresh_strength
    @strength = rand(30..40)
  end

  def refresh_number_of_hits
    @number_of_hits = 1
  end
end
