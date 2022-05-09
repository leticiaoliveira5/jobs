class AddCoursesToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :courses, :string
  end
end
