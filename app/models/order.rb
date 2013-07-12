class Order < ActiveRecord::Base
  attr_accessible :phone, :username, :code, :action_id

  after_create :send_notifications

private
  def send_notifications
    send_notification '79629186985', sms_text_to_admin
    send_notification phone, sms_text_to_client
  end

  def send_notification phone, sms
    response = HTTParty.get(
        'http://api.sms24x7.ru',
        query: {
            method: 'push_msg',
            email: 'agatovs@gmail.com',
            password: 'avv6rqE',
            phone: phone,
            text: sms,
            sender_name: 'Retto.ru'
        }
    )

    #if response.parsed_response['response']['msg']['text'] == 'OK'
    #  true
    #else
    #  false
    #end
  end

  def sms_text_to_admin
    I18n.translate(
        'sms.notification_message_to_admin',
        username: username,
        phone: phone,
        date: Russian.strftime(created_at, '%d %b, %H:%M')
    )
  end

  def sms_text_to_client
    I18n.translate(
        'sms.notification_message_to_client',
        username: username,
        code: code,
        date: Russian.strftime(created_at, '%d %b, %H:%M')
    )
  end
end
