module ApplicationHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  MOBILE_BROWSERS = [
      'playbook', 'windows phone', 'android', 'ipod', 'iphone', 'opera mini', 'blackberry', 'palm','hiptop',
      'avantgo','plucker', 'xiino','blazer','elaine', 'windows ce; ppc;', 'windows ce; smartphone;',
      'windows ce; iemobile', 'up.browser','up.link','mmp','symbian','smartphone', 'midp','wap','vodafone',
      'o2','pocket','kindle', 'mobile','pda','psp','treo'
  ]

  def mobile_browser?(agent)
    agent.downcase!

    return false if agent.match('ipad')

    MOBILE_BROWSERS.each do |m|
      return true if agent.match(m)
    end
    false
  end

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      
      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
