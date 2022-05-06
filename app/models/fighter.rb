# Defines a fighter and their stats in battle
class Fighter
  attr_reader :name, :strength, :accuracy, :number_of_hits, :speed
  attr_accessor :health

  def initialize(stats = {})
    # Fighter's name
    @name = stats[:name]
    # How many hitpoints the fighter has until knocked out.
    @base_health = stats[:health]
    # How much damage does the fighter do.
    @base_strength = stats[:strength]
    # Chance of hitting or missing the target.
    @base_accuracy = stats[:accuracy]
    # How many times the fighter will hit in one turn.
    @base_number_of_hits = stats[:number_of_hits]
    # The higher the speed, the more likely to hit first.
    @base_speed = stats[:speed]
    # Class, different classes have different bonus stats
    @class = stats[:class]
    set_class(stats)
  end

  def alive?
    @base_health.positive?
  end

  def dead?
    @base_health.zero?
  end

  def set_class(fighter_class)
    case fighter_class
    when :balanced then puts 'balanced'
    when :tank then puts 'tank'
    when :glass_canon then puts 'glass canon'
    when :assassin then puts 'assassin'
    end
  end
end
