class CandidatesController < ApplicationController
  include ActionView::Helpers::AssetTagHelper
  before_action :authenticate_candidate!

  def index
    return unless candidate_signed_in?

    avatar = current_candidate.avatar
    @avatar = if avatar.attached?
                image_tag(avatar, size: '50x50', style: 'border-radius: 50%;')
              else
                image_tag('icon.png', size: '50x50')
              end
  end
end
