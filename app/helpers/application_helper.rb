module ApplicationHelper
  def user_avatar(user, size: '50x50')
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    image_tag(avatar, size: size, style: 'border-radius: 50%;')
  end

  def t_attr(str)
    t("activerecord.attributes.#{str}")
  end
end
