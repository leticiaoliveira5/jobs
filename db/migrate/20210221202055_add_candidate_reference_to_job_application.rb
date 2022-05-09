class AddCandidateReferenceToJobApplication < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_applications, :candidate, foreign_key: true
  end
end
