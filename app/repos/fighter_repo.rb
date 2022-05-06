class FighterRepo
  attr_accessor :fighter_danby, :fighter_sharpie, :fighter_pff, :fighter_sohail

  def initialize
    # Balanced fighter
    @fighter_danby = Fighter.new(
      name: 'Danby',
      health: 100,
      strength: rand(15..25),
      accuracy: 90,
      number_of_hits: 1,
      speed: 2,
      class: :balanced
    )
    # Glass canon fighter
    @fighter_sharpie = Fighter.new(
      name: 'Sharpie',
      health: 70,
      strength: rand(10..20),
      accuracy: 80,
      number_of_hits: 2,
      speed: 4,
      class: :'glass canon'
    )
    # Tanky fighter
    @fighter_pff = Fighter.new(
      name: 'Pinky Flowerface',
      health: 130,
      strength: 10,
      accuracy: 100,
      number_of_hits: 1,
      speed: 1,
      class: :tank
    )
    # Wild card fighter
    @fighter_sohail = Fighter.new(
      name: 'Sohail',
      health: 50,
      strength: rand(15..20),
      accuracy: 60,
      number_of_hits: rand(2..4),
      speed: 3,
      class: :assassin
    )
  end
end
