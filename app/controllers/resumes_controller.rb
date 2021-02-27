class ResumesController < ApplicationController

    def index
    end

    def show
        @resume = Resume.joins(:candidate).find(params[:id])
    end

    def create
        resume_params = params.require(:resume).permit(:address,
                                                :education,
                                                :experience,
                                                :languages,
                                                :abilities,
                                                :courses)
        @resume = Resume.new(resume_params)
    end

    def edit
        @resume = Resume.find(params[:id])
    end

      def update
        @resume = Resume.find(params[:id])
        @resume.update(address: params[:resume][:address], 
        education: params[:resume][:education],
        experience: params[:resume][:experience],
        languages: params[:resume][:languages],
        abilities: params[:resume][:abilities],
        courses: params[:resume][:courses])
        redirect_to resume_path(@resume)

    end

end