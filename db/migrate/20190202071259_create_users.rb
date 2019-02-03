class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.integer :birthyear
      t.integer :birthmonth
      t.integer :birthdate
      t.string :address
      t.string :telephone
      t.string :email
      t.string :academic_background
      t.string :image
      t.string :resume_file
      t.string :career_file
      t.string :experience
      t.string :password_digest

      t.timestamps
    end
  end
end
