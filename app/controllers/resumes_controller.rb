class ResumesController < ApplicationController
  before_action :authenticate_candidate!, :set_resume, except: :show

  def show
    unless candidate_signed_in? || employee_signed_in?
      redirect_to root_path, alert: 'Você não tem permissão para ver esta página'
    end
    @resume = current_candidate&.resume || Resume.find(params[:id])
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

  # rubocop:disable Naming/MemoizedInstanceVariableName
  def set_resume
    @resume ||= current_candidate.resume
  end
  # rubocop:enable Naming/MemoizedInstanceVariableName

  def resume_params
    params.require(:resume).permit(:address,
                                   :education,
                                   :experience,
                                   :languages,
                                   :abilities,
                                   :courses)
  end
end
