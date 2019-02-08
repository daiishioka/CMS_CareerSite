class RemoveAgeCalculateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age_calculate, :integer
  end
end
