class CreateBackers < ActiveRecord::Migration
  def change
    create_table :backers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
