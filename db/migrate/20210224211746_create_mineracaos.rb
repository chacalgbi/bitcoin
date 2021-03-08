class CreateMineracaos < ActiveRecord::Migration[5.2]
  def change
    create_table :mineracaos do |t|
      t.string :nome
      t.string :acronimo

      t.timestamps
    end
  end
end
