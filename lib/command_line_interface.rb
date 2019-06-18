class CLI
  INTRO_MESSAGE = "WELCOME TO CRAIGSLIST SCRAPPER!"

  def run
    @scrape = CraigsList.new

  end
    
  
  def display_main_menu
    stars = "************************".colorize(:yellow)
    puts "#{stars} MAIN MENU #{stars}" 
    puts "Enter \"scrape\" to scrape.".colorize(:blue)
    puts "Enter \"exit\" to end program.".colorize(:yellow)
    puts "What would you like to do?".colorize(:blue)
    gets.chomp
  end

  def display_states
    @scrape.get_states_names.each_with_index do |state, index|
      print "#{index + 1}. #{state}    ".ljust(28) 
      if (index + 1) % 5 == 0
        print "\n"
      end
    end
    print "\n"
  end 

  def display_cities(state)
    @state_cities = @scrape.get_state_cities(state)
    #find max length of city and use it left justify everything else for screen output
    max_length = @state_cities.map(&:length).max
    @state_cities.each_with_index do |city, index|
      print "#{index + 1}. #{city.capitalize.ljust(max_length)}   " 
      if (index + 1) % 3 == 0
        print "\n"
      end
    end
    print "\n"
  end



  def get_choice
    puts "Enter number to see link phone on browser.".colorize(:cyan)
    puts "next for more phones".colorize(:green)
    puts "Or enter exit to re-scrape.".colorize(:blue)
    gets.chomp
  end

end