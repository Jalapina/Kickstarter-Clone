class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :description
      t.text :risk
      t.references :dream, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
