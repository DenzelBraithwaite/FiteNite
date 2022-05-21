require 'colorize'

require_relative 'router'
require_relative 'controllers/parent_controller'
require_relative 'controllers/fighter_controller'
require_relative 'repos/fighter_repo'
require_relative 'views/fighter_view'

# Fighter repo
fighter_repo = FighterRepo.new

# Fighter view
fighter_view = FighterView.new

# Fighter controller
fighter_controller = FighterController.new(fighter_repo, fighter_view)

# Main router
router = Router.new(fighter_controller)

router.run
