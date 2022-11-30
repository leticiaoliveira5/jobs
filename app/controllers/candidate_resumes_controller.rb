class CandidateResumesController < ApplicationController
  before_action :authenticate_candidate!, :set_resume

  def show
    render template: 'resumes/show'
  end

  def edit
    render template: 'resumes/edit'
  end

  def update
    @resume.update(resume_params)
    redirect_to resume_path, notice: t('.success') if @resume.save
  end

  private

  def set_resume
    @resume ||= current_candidate.resume
  end

  def resume_params
    params.require(:resume).permit(:address,
                                   :education,
                                   :experience,
                                   :languages,
                                   :abilities,
                                   :courses)
  end
end
