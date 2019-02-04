class AddCompanycolumnToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :company, foreign_key: true
  end
end
