class Trade

  attr_accessor :ticker
  attr_accessor :qty
  attr_accessor :px_bought

  def initialize
    ticker="default ticker"
    name="default name"
  end

  def print_a_trade
    puts "Trade: " + self.ticker + " " +self.qty.to_s + " " + self.px_bought.to_s
  end
end