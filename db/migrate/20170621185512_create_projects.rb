class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :residence
      t.decimal :goal
      t.integer :duration
      t.text :blur
      t.references :user, index: true, foreign_key: true
      t.string :location
      t.boolean :launch

      t.timestamps null: false
    end
  end
end
