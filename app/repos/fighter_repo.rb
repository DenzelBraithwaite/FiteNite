require_relative '../models/assassin'
require_relative '../models/balanced'
require_relative '../models/tank'
require_relative '../models/warrior'

class FighterRepo
  attr_accessor :fighter_danby, :fighter_sharpie, :fighter_pff, :fighter_sohail

  def initialize
    @fighter_danby = Balanced.new(name: 'Danby')
    @fighter_sharpie = Warrior.new(name: 'Sharpie')
    @fighter_pff = Tank.new(name: 'Pinky Flowerface')
    @fighter_sohail = Assassin.new(name: 'Sohail')
  end
end
