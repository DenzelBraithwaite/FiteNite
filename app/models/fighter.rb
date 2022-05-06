# Defines a fighter and their stats in battle
class Fighter
  attr_reader :name, :strength, :accuracy, :number_of_hits, :speed
  attr_accessor :health

  def initialize(stats = {})
    # Fighter's name
    @name = stats[:name]
    # How many hitpoints the fighter has until knocked out.
    @base_health = 100
    # How much damage does the fighter do.
    @base_strength = 10
    # Chance of hitting or missing the target.
    @base_accuracy = 100
    # How many times the fighter will hit in one turn.
    @base_number_of_hits = 1
    # The higher the speed, the more likely to hit first.
    @base_speed = 1
    # Class, different classes have different bonus stats
    @class = stats[:class]
    set_class
  end

  def alive?
    @base_health.positive?
  end

  def dead?
    @base_health.zero?
  end

  def set_class
    case @class
    when :balanced
      self.strength = rand(15..25),
      self.accuracy -= 10,
      self.speed += 1
    when :tank
      self.health += 30
    when :glass_canon
      self.health -= 30,
      self.strength rand(10..20),
      self.accuracy: 100,
      self.number_of_hits: 1,
      self.speed: 1,
    when :assassin
      self.health += 30,
      self.strength: 10,
      self.accuracy: 100,
      self.number_of_hits: 1,
      self.speed: 1,
    end
  end
end
