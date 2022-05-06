require 'colorize'

require_relative 'router'
require_relative 'controllers/fighter_controller'
require_relative 'models/fighter'
require_relative 'repos/fighter_repo'
# require_relative 'views/fighter'

# Fighter repo
fighter_repo = FighterRepo.new

# Fighter controller
fighter_controller = FighterController.new(fighter_repo)

# Main router
router = Router.new(fighter_controller)

router.run
