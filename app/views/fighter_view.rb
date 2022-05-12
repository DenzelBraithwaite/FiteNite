class FighterView
  def view_fighters
    puts 'Pick your fighter!'
    puts '1 - Danby (balanced)'
    puts '2 - Pinky Flowerface(tank)'
    puts '3 - Sharpie(warrior)'
    puts '4 - SoHAIL!(assassin)'
    puts '5 - Kazul!(Healer)'
    puts ''
    print '> '
  end

  def display_fighters(fighter_one, fighter_two)
    puts "This battle's fighters are:"
    puts "Fighter 1 --> #{fighter_one.name.light_cyan}"
    puts "Fighter 2 --> #{fighter_two.name.light_cyan}"
    sleep(3)
  end
end
