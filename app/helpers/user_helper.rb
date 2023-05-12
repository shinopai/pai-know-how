module UserHelper
  def set_class_name(category_id)
    case category_id
    when 1
      'news'
    when 2
      'share'
    when 3
      'knowhow'
    end
  end

  def is_myself(user_id, current_user_id)
    unless user_id == current_user_id
      return true
    else
      return false
    end
  end

  def is_following(partner_id, current_user)
    current_user.follows.where(partner_id: partner_id).any?
  end
end
