module UserProfileHelper
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
end
