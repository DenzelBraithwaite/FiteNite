require_relative 'parent_view'

class FighterView < ParentView
  def main_menu
    puts 'Enter a number to select an option.'
    puts '1 - Fight'
    puts '2 - Class info'
    puts '9 - Quit'
    puts ''
    print '> '
  end

  def view_fighters
    puts 'Pick your fighter class!'
    puts '1 - Balanced'
    puts '2 - Tank'
    puts '3 - Warrior'
    puts '4 - Assassin'
    puts '5 - Priest'
    puts ''
    print '> '
  end

  def pick_a_name
    puts 'Enter a name for your fighter'
    puts ''
    print '> '
  end

  def view_fighter_details
    puts 'Balanced - (Average overall stats)'
    puts 'Tank - (High health, low damage, slow speed)'
    puts 'Warrior - (Above average health, above average damage, can hit twice, low accuracy, average speed)'
    puts 'Assassin - (High damage, low health, very fast, can hit 2-4 times, low accuracy)'
    puts 'Priest - (below average health, below average accuracy, can hit twice but usually once, strength varies)'
    puts ''
  end

  def display_fighters(fighter_one, fighter_two)
    puts "This battle's fighters are:"
    puts "Fighter 1 --> #{fighter_one.name.light_cyan} the #{fighter_one.class.to_s.cyan}"
    puts "Fighter 2 --> #{fighter_two.name.light_cyan} the #{fighter_two.class.to_s.cyan}"
  end

  def invalid_selection
    clear_screen
    puts 'invalid'
    clear_screen
  end
end
