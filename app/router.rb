class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    @controller.run
  end
end
