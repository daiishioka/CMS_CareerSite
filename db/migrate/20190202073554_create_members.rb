class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :sex
      t.string :telephone
      t.string :email
      t.string :belonged_company
      t.references :company, foerign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
