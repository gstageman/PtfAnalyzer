
class Portfolio

  require_relative 'trade'

  attr_accessor :portfolio_name
  attr_accessor :portfolio_description
  attr_accessor :trade_list

  def initialize
    trade_list = []
    portfolio_name="default portfolio"
    portfolio_description="default portfolio name"
  end

  def print_portfolio_header
    puts self.portfolio_name
    puts self.portfolio_description
  end

  def print_portfolio_trades
    puts "Trade List..."
    puts self.portfolio_name
    puts self.portfolio_description
    puts self.trade_list
    puts "End of Trade List"

  end

  def load_portfolio (portfolio_file)
    trade_list = []
    $i=0
    File.open(portfolio_file).readlines.each_with_index { |line, i|
      CSV.parse(line) do |line|
        ptf, ticker, qty, buypx = line
        trade=Trade.new
        trade_list<<trade
        trade_list[$i].ticker = ticker
        trade_list[$i].qty = qty.to_s
        trade_list[$i].px_bought = buypx.to_s
        #trade[$i].print_a_stock
      end
      $i=$i+1
    }
    return trade_list
  end

end