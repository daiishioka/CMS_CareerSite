class AddDatesToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :established_yearmonth, :date
  end
end
