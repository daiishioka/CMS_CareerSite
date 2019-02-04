class ChangeDataSexToMembers < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :sex, :string
  end
end
