class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :direction
      t.integer :size
      t.string :product
      t.datetime :trade_date
    end
  end
end
