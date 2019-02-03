class RemoveMainmemberFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :main_member_id, :integer
  end
end
