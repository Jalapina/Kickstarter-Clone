class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.integer :pledged
      t.text :description
      t.boolean :shipping
      t.integer :limit
      t.date :delivery
      t.references :dream, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
