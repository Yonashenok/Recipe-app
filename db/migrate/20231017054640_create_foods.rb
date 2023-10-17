class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :measurement_unit, :default => 'grams'
      t.integer :price, :default =>  1
      t.integer :quantity, :default => 1

      t.timestamps
    end
  end
end
