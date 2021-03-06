module Applephile
  class CLI
    INTRO_MESSAGE = "WELCOME TO CRAIGSLIST SCRAPPER!"

    def run
      @scrape = Applephile::CraigsList.new
       puts INTRO_MESSAGE
      choice = ""
      while choice != "exit"      
        choice = display_main_menu
        if choice == "scrape"
          get_menu_input
          create_items_from_array(scrape_apple_prodcuts)
          grab_apple_prodcuts
        end
      end
    end
    
    def display_main_menu
      stars = "************************".colorize(:yellow)
      puts "#{stars} MAIN MENU #{stars}" 
      puts "Enter \"scrape\" to scrape.".colorize(:blue)
      puts "Enter \"exit\" to end program.".colorize(:yellow)
      puts "What would you like to do?".colorize(:blue)
      gets.chomp
    end

    def get_menu_input
      display_states
      puts "Please enter a number for the state you'd like to scrape.".colorize(:green)
      #convert number input from user
      @state_scraped = convert_to_state(gets.chomp)
      display_cities(@state_scraped)
      puts "Please enter a number for the city you'd like to scrape.".colorize(:green)
      @city_scraped = convert_to_city(@state_scraped, gets.chomp)
      puts "You have chosen the state of #{@state_scraped}, and the city of #{@city_scraped.capitalize}."
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

    def convert_to_state(state_number)
      #it takes in a number and returns the corresponding state's name
      @scrape.get_states_names[state_number.to_i - 1]
    end

    def convert_to_city(state, city_number)
      #it takes in a number and returns the corresponding city's name
        @state_cities[city_number.to_i - 1] 
    end 

    def scrape_apple_prodcuts
      @scraped_city_url = @scrape.return_city_link(@state_scraped, @city_scraped)
      @phones = @scrape.scrape_by_city_url(@scraped_city_url)
    end

    def grab_apple_prodcuts
      puts "Price enter a price higher than 150 to see the list of phones, defualt price is 150.".colorize(:blue)
      display_apple_products_info(@city.get_apple_prods_by_price(gets.chomp))
    end

    def create_items_from_array(phones_array)
      if phones_array.empty?
        puts "Your search return zero hits, please scrape again"
        get_menu_input
        create_items_from_array(scrape_apple_products())
      else
        @city = Applephile::City.new({:name => @city_scraped, :state => @state_scraped,
                          :city_url => @scraped_city_url})
        phones_array.each do |phone_info| 
          @city.add_item(Applephile::Item.new(phone_info))
        end
      end
    end

    def display_apple_products_info(apple_products)
      separator = "-+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+--+-+-+".colorize(:yellow)
      puts "The following phones were found in accordance to your search parameters."
      choice = ""
      while choice != "exit"
        apple_products.each_with_index do |product, index|
          puts "#{index + 1}: #{product.description}"
          puts "Price: $#{product.price}"
          puts "Phone's url: #{product.url}"
          puts "Phone's City: #{product.city.name}"
          puts separator

          if (index + 1) % 5 == 0
            # puts "Enter number to see link phone on browser.".colorize(:cyan)
            # puts "next for more phones".colorize(:green)
            # puts "Or enter exit to re-scrape.".colorize(:blue)

            choice = get_choice
            if choice == "next"
              next
            elsif choice == 'exit'
              break
            else
              #make sure screen stays on all present create_items_from_array
              phone_url = apple_products[choice.to_i - 1].url 
              system("open", phone_url)
            end
          end
        end  
        puts "There are no moh phones to show."
      end    
    end

    def get_choice
      puts "Enter number to see link phone on browser.".colorize(:cyan)
      puts "next for more phones".colorize(:green)
      puts "Or enter exit to re-scrape.".colorize(:blue)
      gets.chomp
    end
  end
end
