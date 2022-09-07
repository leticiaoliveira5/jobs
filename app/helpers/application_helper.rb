module ApplicationHelper
  def user_avatar(user)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    image_tag(avatar, size: '50x50', style: 'border-radius: 50%;')
  end

  def generate_document
    str = ''
    14.times { str << rand(0..9).to_s }
    str
  end
end
