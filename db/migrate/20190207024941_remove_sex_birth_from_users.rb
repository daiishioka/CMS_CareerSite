class RemoveSexBirthFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex, :integer
    remove_column :users, :birthyear, :integer
    remove_column :users, :birthmonth, :integer
  end
end
