class RemoveManagerId < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :manager_id
    remove_column :teachers, :student_id
  end
end
