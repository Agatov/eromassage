module ApplicationHelper
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
end
