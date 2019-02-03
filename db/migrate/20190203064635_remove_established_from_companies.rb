class RemoveEstablishedFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :established_year, :integer
    remove_column :companies, :established_month, :integer
  end
end
