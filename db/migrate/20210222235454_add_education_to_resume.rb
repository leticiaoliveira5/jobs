class AddEducationToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :education, :string
  end
end
