class RemoveCompanyIdFromRecruits < ActiveRecord::Migration[5.2]
  def change
    remove_column :recruits, :company_id, :integer
  end
end
