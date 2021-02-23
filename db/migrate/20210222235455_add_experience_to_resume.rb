class AddExperienceToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :experience, :string
  end
end
