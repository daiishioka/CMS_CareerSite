class AddBusinessDescriptionToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :business_description, :text
  end
end
