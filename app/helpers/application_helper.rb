module ApplicationHelper
  def user_avatar(user, size: '50x50', link: nil)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    img = image_tag(avatar, size:, style: 'border-radius: 50%;')

    link ? link_to(img, link) : img
  end

  def t_attr(str)
    t("activerecord.attributes.#{str}")
  end

  def see_more(instance)
    link_to fa_icon('eye', title: 'Ver', class: 'green-icon'), instance
  end
end
