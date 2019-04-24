class AddColumnToRecruits < ActiveRecord::Migration[5.2]
  def change
    add_column :recruits, :job_requirement, :string
    add_column :recruits, :hire_type, :string
    add_column :recruits, :quolification_reqirement, :text
    add_column :recruits, :working_place, :text
    add_column :recruits, :working_time, :string
    add_column :recruits, :salary, :string
    add_column :recruits, :welfare, :text
    add_column :recruits, :holiday, :text
    add_column :recruits, :application_method, :string
    add_column :recruits, :interview_process, :text
    add_column :recruits, :interview_place, :string
    add_column :recruits, :pic, :string
  end
end
