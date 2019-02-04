class RemoveCompanyidFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :company_id, :integer
  end
end
