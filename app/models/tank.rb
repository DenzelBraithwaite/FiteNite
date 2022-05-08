require_relative 'fighter'

class Tank < Fighter
  def initialize(stats = {})
    @name = stats[:name]
    super(strength)
    super(accuracy)
    super(number_of_hits)
    super(speed)
    @health = 130
  end
end
