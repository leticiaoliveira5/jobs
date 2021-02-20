class AddFirstnameToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :firstname, :string
  end
end
