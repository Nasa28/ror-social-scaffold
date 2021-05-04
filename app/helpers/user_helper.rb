module UserHelper
  def alert_me
    result = ' '
    if notice.present?
      result += '<div class="notice">'
      result += '<p>'
      result += notice
      result += '</p>'
      result += '</div>'
    end
    if alert.present?
      result += '<div class="alert">'
      result += '<p>'
      result += alert
      result += '</p>'
      result += '</div>'
    end
    result.html_safe
  end
end
