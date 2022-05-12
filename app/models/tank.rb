require_relative 'fighter'

class Tank < Fighter
  def initialize(name)
    super
    # super(strength)
    # super(accuracy)
    # super(number_of_hits)
    # super(speed)
    # @name = name
    @health = 130
  end

  def refresh_strength
    @strength = 10
  end

  def refresh_number_of_hits
    @number_of_hits = 1
  end
end
