require_relative 'fighter'

class Assassin < Fighter
  def initialize(stats = {})
    @name = stats[:name]
    @health = 60
    @strength = rand(15..20)
    @accuracy = 60
    @number_of_hits = rand(2..4)
    @speed = 4
  end
end
