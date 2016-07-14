class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :rate
      t.references :food_item, foreign_key: true

      t.timestamps
    end
  end
end
