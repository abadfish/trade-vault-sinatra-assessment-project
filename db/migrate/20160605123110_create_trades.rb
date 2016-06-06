class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :direction
      t.integer :size
      t.string :product
      t.date :trade_date
      t.integer :user_id
    end
  end
end
