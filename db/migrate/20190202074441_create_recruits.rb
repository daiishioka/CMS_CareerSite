class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.text :recruitment_background
      t.text :job_description
      t.text :requirement
      t.text :selection_process

      t.timestamps
    end
  end
end
