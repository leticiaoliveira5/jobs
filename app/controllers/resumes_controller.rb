# frozen_string_literal: true

class ResumesController < ApplicationController
  def index; end

  def show
    @resume = Resume.joins(:candidate).find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)
    redirect_to resume_path(@resume)
  end

  private

  def resume_params
    params.permit(:address,
                  :education,
                  :experience,
                  :languages,
                  :abilities,
                  :courses)
  end
end
