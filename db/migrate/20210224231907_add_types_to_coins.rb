class AddTypesToCoins < ActiveRecord::Migration[5.2]
  def change
    add_reference :coins, :mineracao, foreign_key: true
  end
end
