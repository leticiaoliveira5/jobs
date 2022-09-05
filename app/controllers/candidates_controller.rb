class CandidatesController < ApplicationController
  before_action :authenticate_candidate!

  def index
    @avatar = if icon.attached?
                image_tag(icon, size: '50x50', style: 'border-radius: 50%;')
              else
                image_tag(size: '50x50')
              end
  end
end
