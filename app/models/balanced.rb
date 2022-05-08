require_relative 'fighter'

class Balanced < Fighter
  def initialize(stats = {})
    @name = stats[:name]
    super(health)
    super(number_of_hits)
    @strength = rand(15..20)
    @accuracy = 90
    @speed = 2
  end
end
