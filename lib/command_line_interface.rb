require "spec_helper"
require_relative "../lib/craigslist.rb"


RSpec.describe "CraigsList" do                  
  let!(:cl_first) {CraigsList.new()}
  let!(:state_names) { 
                  ['Alabama','Alaska','Arizona','Arkansas','California',
                  'Colorado','Connecticut','Delaware','District of Columbia','Florida',
                  'Georgia','Hawaii',
                  'Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana',
                  'Maine','Marshall Islands','Maryland','Massachusetts','Michigan',
                  'Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada',
                  'New Hampshire','New Jersey','New Mexico','New York','North Carolina',
                  'North Dakota','Ohio','Oklahoma','Oregon',
                  'Palau','Pennsylvania','Rhode Island','South Carolina',
                  'South Dakota','Tennessee','Texas','Utah','Vermont',
                  'Virginia','Washington','West Virginia','Wisconsin','Wyoming']
                }

  let!(:cities_and_links_data) { [{"auburn" =>"https://auburn.craigslist.org/"},
                            {"fort collins"=>"https://fortcollins.craigslist.org/"},
                            {"macon"=>"https://macon.craigslist.org/"}] } 

  let!(:states_cities_links_data){  {:Montana => [{"billings"=>"https://billings.craigslist.org/"},
                                                  {"bozeman"=> "https://bozeman.craigslist.org/"},
                                                  {"butte"=>"https://butte.craigslist.org/"}],
                                    :Minnesota => [{"bemidji"=>"https://bemidji.craigslist.org/"},
                                                  {"brainerd"=>"https://brainerd.craigslist.org/"},
                                                  {"duluth"=>"https://duluth.craigslist.org/"}],
                                   :"New Mexico" =>[{"albuquerque"=>"https://albuquerque.craigslist.org/"},
                                                  {"clovis"=>"https://clovis.craigslist.org/"},
                                                  {"farmington"=>"https://farmington.craigslist.org/"}]
                                    }
                                 }  
  let!(:p_hash) { { :url=>"https://amarillo.craigslist.org/mob/d/amarillo-iphone-8-plus-256gb-gold-unlock/6906496735.html", 
                    :price=>"650", 
                    :description=>"Iphone 8 plus 256gb gold (unlock)"}
                }  

  def choose_random_state
    state_names[rand(0..state_names.length - 1)]
  end

end


