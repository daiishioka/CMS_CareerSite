class AddPrefectureCetificationColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :prefecture, foreign_key: true
    add_column :users, :certification, :text
  end
end
