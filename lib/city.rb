class City
  attr_accessor :name, :state, :city_url
  attr_reader :items

  @@all = []

  def initialize(city_attributes)
    city_attributes.each {|key, value| self.send(("#{key}="), value)}
    @items = []
    @@all << self
  end

  def add_item(item)
    item.city = self
    @items << item
    item
  end

  describe "#get_apple_prods_by_price" do
    it "it accpets a price, then it returns all
      the items that are greater than or equals to that price" do
      city_a_hash = {:name => "las vegas", :state => "Nevada",
                      :city_url => "https://lasvegas.craigslist.org/"}
      city_a = City.new(city_a_hash)
      city_a = add_items_to_city(city_a)
      length = city_a.get_apple_prods_by_price(200).length
      expect(city_a.get_apple_prods_by_price(200)[rand(0..length - 1)].price).to be >= "200"
      
    end
  end
end
