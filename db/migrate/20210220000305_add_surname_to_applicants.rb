class AddSurnameToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :surname, :string
  end
end
