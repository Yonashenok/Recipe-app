class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time, :default => 1
      t.integer :cooking_time, :default => 1
      t.text :description
      t.boolean :public, :default => false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
