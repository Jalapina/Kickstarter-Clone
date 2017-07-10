class RenameDreamIdToProjectId < ActiveRecord::Migration
  def change
    rename_column :rewards, :dream_id, :project_id
  end
end
