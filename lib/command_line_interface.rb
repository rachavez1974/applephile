class CLI
  def run
    
  end

  def get_choice
    puts "Enter number to see link phone on browser.".colorize(:cyan)
    puts "next for more phones".colorize(:green)
    puts "Or enter exit to re-scrape.".colorize(:blue)
    gets.chomp
  end
end