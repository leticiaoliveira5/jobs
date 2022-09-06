module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      image_tag(user.avatar, size: '50x50', style: 'border-radius: 50%;')
    else
      image_tag('icon.png', size: '50x50')
    end
  end
end
