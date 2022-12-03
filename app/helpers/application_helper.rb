module ApplicationHelper
  def user_avatar(user)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    image_tag(avatar, size: '50x50', style: 'border-radius: 50%;')
  end

  def t_attr(str)
    t("activerecord.attributes.#{str}")
  end

  def enum_humanized_names(klass = ExampleKlass, enum_name = 'enum_name')
    enum_plural = enum_name.pluralize
    klass.send(enum_plural).keys.map do |key|
      t_attr("#{klass.model_name.param_key}.#{enum_name}.#{key}")
    end
  end

  def normalize_name(name)
    return if name.blank?

    name[0].capitalize + name[1..].downcase
  end
end
