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
    battle(@fighter_danby, @fighter_pff)
    puts 'End'
  end

  # Full battle
  def battle(fighter_one, fighter_two)
    round = 1
    while fighter_one.alive? && fighter_two.alive?
      puts "Round: #{round}".blink
      round(fighter_one, fighter_two)
      round += 1
      sleep(0.5)
    end
    battle_over(fighter_one, fighter_two)
  end

  # Logic for each round.
  def round(fighter_one, fighter_two)
    fighters = who_moves_first(fighter_one, fighter_two)
    first_attacker = fighters.first
    second_attacker = fighters.last
    first_attacker.number_of_hits.times do
      if hit_landed?(first_attacker)
        attack(first_attacker, second_attacker)
      else
        puts "#{first_attacker.name} missed!"
      end
      # first_attacker needs to refresh his chance of hitting
    end
    puts ''
    if hit_landed?(second_attacker)
      attack(second_attacker, first_attacker)
    else
      puts "#{second_attacker.name} missed!"
    end
    puts '------------------------------------------------'.light_black
    puts ''
  end

  def who_moves_first(fighter_one, fighter_two)
    fighters = %w[fighter_one fighter_two]
    if fighter_one.speed > fighter_two.speed
      [fighter_one, fighter_two]
    elsif fighter_one.speed == fighter_two.speed
      fighters.sample
    else
      [fighter_two, fighter_one]
    end
  end

  # fighter one attacks fighter two
  def attack(fighter_one, fighter_two)
    damage = fighter_one.strength
    fighter_two.health -= damage
    puts "#{fighter_one.name} attacks #{fighter_two.name} dealing #{damage.to_s.red} damage."
    puts "#{fighter_two.name} has #{fighter_two.health.to_s.green} health remaining"
  end

  def battle_over(fighter_one, fighter_two)
    if fighter_one.dead?
      puts "#{fighter_one.name} just died."
    else
      puts "#{fighter_two.name} just died."
    end
  end
end
