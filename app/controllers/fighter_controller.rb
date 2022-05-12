class FighterController
  def initialize(repo)
    @repo = repo
    @fighter_danby = @repo.fighter_danby
    @fighter_pff = @repo.fighter_pff
    @fighter_sharpie = @repo.fighter_sharpie
    @fighter_sohail = @repo.fighter_sohail
  end

  # Starts game
  def run
    system('clear')
    battle(@fighter_sharpie, @fighter_sohail)
    puts 'End'
  end

  # Full battle
  def battle(fighter_one, fighter_two)
    round = 1
    while fighter_one.alive? && fighter_two.alive?
      puts "Round: #{round}".cyan.blink
      round(fighter_one, fighter_two)
      round += 1
      sleep(0.5)
    end
    battle_over(fighter_one, fighter_two)
  end

  # Prepares attack
  def attack(fighter)
    total_damage = 0
    # Set number of hits
    fighter.refresh_number_of_hits
    # Let player know how many times fighter will hit
    puts "#{fighter.name} hit #{fighter.number_of_hits.to_s.cyan} time(s)"
    # Check how many times the fighter attacks
    fighter.number_of_hits.times do
      # Check if attack landed
      if fighter.hit_landed?
        # Reset damage
        fighter.refresh_strength
        total_damage += fighter.strength
        puts "#{fighter.name} attacked with #{fighter.strength.to_s.red} damage"
      else
        puts "#{fighter.name} #{'missed'.light_yellow}!"
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
    fighters = %w[fighter_one fighter_two]
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
    puts "#{fighter_two.name} has #{fighter_two.health.to_s.green} health remaining"
    puts "#{fighter_one.name} has #{fighter_two.health.to_s.green} health remaining"
  end

  # End of battle message
  def battle_over(fighter_one, fighter_two)
    if fighter_one.dead?
      puts "#{fighter_one.name} just died."
    else
      puts "#{fighter_two.name} just died."
    end
  end

  # Prevents health from going below 0
  def prevent_negative_health(fighter)
    fighter.health = 0 if fighter.health.negative?
  end
end
