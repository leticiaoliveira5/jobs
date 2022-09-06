module ApplicationHelper
  def user_avatar(user)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    image_tag(avatar, size: '50x50', style: 'border-radius: 50%;')
  end
  
    # crete component for these methods
  def inactivate_link(job_opportunity)
    return unless job_opportunity.inactive?

    link_to 'Inativar vaga',
            inactivate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def activate_link(job_opportunity)
    return unless job_opportunity.active?

    link_to 'Ativar vaga',
            activate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def edit_link(job_opportunity)
    link_to 'Editar vaga', edit_job_opportunity_path(job_opportunity)
  end

  def apply_link(job_opportunity, candidate)
    candidate_applied = job_opportunity.candidates.include?(candidate) if candidate.present?

    if candidate_applied
      'Você está inscrito nesta vaga.'
    elsif !candidate_applied && job_opportunity.active?
      link_to 'Inscrever-se nesta vaga',
              create_job_application_job_opportunity_path(job_opportunity),
              method: :post
    end
  end
end
