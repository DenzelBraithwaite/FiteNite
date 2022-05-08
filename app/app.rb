require 'colorize'

require_relative 'router'
require_relative 'controllers/fighter_controller'
require_relative 'models/assassin'
require_relative 'models/balanced'
require_relative 'models/tank'
require_relative 'models/warrior'
require_relative 'repos/fighter_repo'
# require_relative 'views/fighter'

# Fighter repo
fighter_repo = FighterRepo.new

# Fighter controller
fighter_controller = FighterController.new(fighter_repo)

# Main router
router = Router.new(fighter_controller)

router.run
