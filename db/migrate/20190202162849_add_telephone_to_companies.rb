class AddTelephoneToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :telephone, :string
  end
end
