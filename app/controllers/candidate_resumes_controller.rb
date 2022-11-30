class CandidateResumesController < ApplicationController
  before_action :authenticate_candidate!

  def show
    @resume = resume
    render template: 'resumes/show'
  end

  def edit
    @resume = resume
    render template: 'resumes/edit'
  end

  def update
    @resume = resume
    @resume.update(resume_params)
    redirect_to resume_path, notice: t('.success') if @resume.save
  end

  private

  def resume
    current_candidate.resume
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
