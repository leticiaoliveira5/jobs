module ApplicationHelper
  def user_avatar(user, size: '50x50', link: nil)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    
    return image_tag(avatar, size: size, style: 'border-radius: 50%;') unless link

    link_to(image_tag(avatar, size: size, style: 'border-radius: 50%;'), link)
  end

  def t_attr(str)
    t("activerecord.attributes.#{str}")
  end

  def see_more(instance)
    link_to fa_icon('eye', title: 'Ver', class: 'green-icon'), instance
  end
end
