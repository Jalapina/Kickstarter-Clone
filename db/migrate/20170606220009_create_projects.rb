class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :residence
      t.decimal :goal
      t.integer :duration
      t.string :location
      t.text :description
      t.text :risk
      t.references :user, index: true, foreign_key: true
      t.references :backers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
