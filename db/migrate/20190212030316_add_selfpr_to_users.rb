class AddSelfprToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :selfpr, :text
  end
end
