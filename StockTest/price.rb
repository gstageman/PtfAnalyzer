#require 'csv'

class Price
  require 'csv'

  attr_accessor :ticker
  attr_accessor :price

  attr_accessor :price_list

  def initialize
    price_list = []
  end

  def load_prices (price_source)
    price_list = []
    $i=0
    File.open(price_source).readlines.each_with_index { |line, i|
      CSV.parse(line) do |line|
        ticker, spot_price = line
        price=Price.new
        price_list<<price
        price_list[$i].ticker = ticker
        price_list[$i].price = spot_price.to_s
        puts "Spot=" +spot_price.to_s
      end
      $i=$i+1
    }
    return price_list
  end

end