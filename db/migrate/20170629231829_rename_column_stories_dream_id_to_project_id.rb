class RenameColumnStoriesDreamIdToProjectId < ActiveRecord::Migration
  def change
    rename_column :stories, :dream_id, :project_id
  end
end
