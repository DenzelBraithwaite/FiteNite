require_relative '../models/assassin'
require_relative '../models/balanced'
require_relative '../models/tank'
require_relative '../models/warrior'
require_relative '../models/priest'

class FighterRepo
  attr_accessor :fighters

  def initialize
    # List of available fighters
    @fighters = [
      @balanced = Balanced.new,
      @tank = Tank.new,
      @warrior = Warrior.new,
      @assassin = Assassin.new,
      @priest = Priest.new
    ]
  end
end
