require_relative '../models/assassin'
require_relative '../models/balanced'
require_relative '../models/tank'
require_relative '../models/warrior'
require_relative '../models/healer'

class FighterRepo
  attr_accessor :fighters

  def initialize
    # List of available fighters
    @fighters = [
      @balanced = Balanced.new('Danby'),
      @tank = Tank.new('Pinky Flowerface'),
      @warrior = Warrior.new('Sharpie'),
      @assassin = Assassin.new('Sohail'),
      @healer = Healer.new('Kazul')
    ]
  end
end
