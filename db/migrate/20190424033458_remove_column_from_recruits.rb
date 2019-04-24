class RemoveColumnFromRecruits < ActiveRecord::Migration[5.2]
  def change
    remove_column :recruits, :requirement, :text
    remove_column :recruits, :selection_process, :text
  end
end
