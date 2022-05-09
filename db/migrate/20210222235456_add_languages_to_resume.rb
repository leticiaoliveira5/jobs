class AddLanguagesToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :languages, :string
  end
end
