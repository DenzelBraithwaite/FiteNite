class FighterController < ParentController
  def initialize(repo, view)
    @repo = repo
    @view = view
  end

  # Starts game
  def run
    @running = true
    while @running
      clear_screen
      @view.main_menu
      action = gets.chomp.to_i
      select_main_menu_option(action)
    end
  end

  # Picks player main menu option
  def select_main_menu_option(action)
    case action
    when 1
      clear_screen
      @view.view_fighters
      action = gets.chomp.to_i
      pick_player(action)
    when 2
      clear_screen
      @view.view_fighter_details
      continue_prompt
    when 9 then @running = false
    end
  end

  # Picks player before battle
  def pick_player(action)
    case action
    when 1 then @fighter_one = @repo.fighters[0]
    when 2 then @fighter_one = @repo.fighters[1]
    when 3 then @fighter_one = @repo.fighters[2]
    when 4 then @fighter_one = @repo.fighters[3]
    when 5 then @fighter_one = @repo.fighters[4]
    else
      puts "Fighter doesn't exist, try again"
      print '> '
      action = gets.chomp.to_i
      pick_player(action)
    end
    @view.pick_a_name
    @fighter_one.name = gets.chomp.capitalize
    pick_opponent
    clear_screen
    @view.display_fighters(@fighter_one, @fighter_two)
    continue_prompt
    battle(@fighter_one, @fighter_two)
  end

  # Pick opponent fighter (computer)
  def pick_opponent
    @fighter_two = @repo.fighters.sample
    @fighter_two = @repo.fighters.sample while @fighter_two == @fighter_one
  end

  # Full battle
  def battle(fighter_one, fighter_two)
    round = 1
    while fighter_one.alive? && fighter_two.alive?
      puts "Round: #{round}".cyan.blink
      round(@fighter_one, @fighter_two)
      round += 1
      continue_prompt
    end
    battle_over(@fighter_one, @fighter_two)
  end

  # Prepares attack
  def attack(fighter)
    total_damage = 0
    # Set number of hits
    fighter.refresh_number_of_hits
    # Chance to heal if player is a healer
    fighter.heal if fighter.healer?
    # Let player know how many times fighter will hit
    puts "#{fighter.name.light_cyan} hit #{fighter.number_of_hits.to_s.cyan} time(s)"
    # Check how many times the fighter attacks
    fighter.number_of_hits.times do
      # Check if attack landed
      if fighter.hit_landed?
        # Reset damage
        fighter.refresh_strength
        total_damage += fighter.strength
        puts "#{fighter.name.light_cyan} attacked with #{fighter.strength.to_s.red} damage"
      else
        puts "#{fighter.name.light_cyan} #{'missed'.light_yellow}!"
      end
    end
    # Calculate damage
    total_damage
  end

  # Logic for each round.
  def round(fighter_one, fighter_two)
    fighters = who_moves_first(fighter_one, fighter_two)
    first_attacker = fighters.first
    second_attacker = fighters.last
    first_attacker_damage = attack(first_attacker)
    puts ''
    second_attacker_damage = attack(second_attacker)
    deal_damage(first_attacker, first_attacker_damage, second_attacker, second_attacker_damage)
    health_remaining(first_attacker, second_attacker)
    puts '------------------------------------------------'.light_black
    puts ''
  end

  def who_moves_first(fighter_one, fighter_two)
    fighters = [fighter_one, fighter_two]
    if fighter_one.speed > fighter_two.speed
      [fighter_one, fighter_two]
    elsif fighter_one.speed == fighter_two.speed
      fighters.shuffle!
    else
      [fighter_two, fighter_one]
    end
  end

  # fighter one attacks fighter two
  def deal_damage(fighter_one, f_one_dmg, fighter_two, f_two_dmg)
    fighter_two.health -= f_one_dmg
    prevent_negative_health(fighter_two)
    return if fighter_two.health.zero?

    fighter_one.health -= f_two_dmg
    prevent_negative_health(fighter_one)
    return if fighter_one.health.zero?
  end

  # Displays remaining health for players
  def health_remaining(fighter_one, fighter_two)
    puts ''
    puts 'Results:'.cyan
    puts "#{fighter_two.name.light_cyan} has #{fighter_two.health.to_s.green} health remaining"
    puts "#{fighter_one.name.light_cyan} has #{fighter_one.health.to_s.green} health remaining"
  end

  # End of battle message
  def battle_over(fighter_one, fighter_two)
    if fighter_one.dead?
      puts "#{fighter_one.name.light_cyan} just died."
    else
      puts "#{fighter_two.name.light_cyan} just died."
    end
  end

  # Prevents health from going below 0
  def prevent_negative_health(fighter)
    fighter.health = 0 if fighter.health.negative?
  end
end
