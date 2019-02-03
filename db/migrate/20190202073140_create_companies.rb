class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :established_year
      t.integer :established_month
      t.string :ceo
      t.string :employees
      t.string :capital_stock
      t.string :headquarter_address
      t.string :homepage
      t.integer :main_member_id

      t.timestamps
    end
  end
end
