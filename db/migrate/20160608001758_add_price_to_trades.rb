class AddPriceToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :price, :number
  end
end
