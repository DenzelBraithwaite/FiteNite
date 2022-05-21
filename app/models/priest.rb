require_relative 'fighter'

class Priest < Fighter
  def initialize
    super
    @health = 100
    @accuracy = 90
    @number_of_hits = [1, 1, 2].sample
    @strength = rand(1..35)
    @speed = 2
  end

  def refresh_strength
    @strength = rand(1..35)
  end

  def refresh_number_of_hits
    @number_of_hits = [1, 1, 2].sample
  end

  def heal
    chance_to_heal = rand(1..10)
    return if chance_to_heal < 7

    heal_amount = rand(15..25)
    @health += heal_amount
    puts "#{@name.light_cyan} #{"healed for #{heal_amount.to_s}".green}"
  end
end
