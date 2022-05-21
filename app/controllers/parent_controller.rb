# General methods that will be reused in other controllers
class ParentController
  def continue_prompt
    puts "Press 'Enter' to continue"
    gets.chomp
  end

  def clear_screen
    system('clear')
  end
end
