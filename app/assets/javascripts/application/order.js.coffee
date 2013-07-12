$ ->

  $('#submit-order').bind 'click', ->
    $.post 'orders', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>
    if data.status == 'ok'

      form = $(@).parent()
      form.hide 'slide', {direction: 'left'}, ->
        $(".success").show 'slide', {direction: 'right'}, ->
          setTimeout(
            ->
              hideDialog()
            1000
          )

  $('#promotional-order').bind 'click', ->
    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').bind 'click', ->
      hide_order_form()

    show_order_form()
    false

  $('#send-order').bind 'click', ->
    username = $('#promotional-form input[name=username]').val()
    phone = $('#promotional-form input[name=phone]').val()
    action_id = $('#promotional-form input[name=action_id]').val()
    if  phone.length != 11
      $('#promotional-form .error-message').hide(100)
      $('#promotional-form #phone-error-message').hide(100).show(300)
      return false
    if  username.length < 2
      $('#promotional-form .error-message').hide(100)
      $('#promotional-form #username-error-message').hide(100).show(300)
      return false
    $.post '/orders', {'order[username]': username, 'order[phone]': phone, 'order[action_id]': action_id}, (data) =>
      $('.modal-overlay').unbind 'click'
      $('.modal-overlay').bind 'click', ->
        hide_thank_you()

      show_thank_you()
    

    false

  $('#promotional-form input[name=phone]').bind 'keyup', ->
    number = $(@).val()
    number_arr = number.split('')
    normal_arr = []
    for symbol in number_arr
      unless isNaN(parseInt(symbol))
        normal_arr.push parseInt(symbol)
    if normal_arr[0] != 7
      normal_arr.unshift 7
    $(@).val(normal_arr.join(''))

  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()
    false


window.show_order_form = ->
  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-dialog').css('bottom', '-300px')
    $('.modal-dialog').css('left', '50%')
    $('.modal-dialog').show()
    $('.modal-dialog').animate({'bottom': '50%'}, 500)
  )

window.hide_order_form = ->
  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()
  )


window.show_thank_you = ->

  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500

#    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
#      $('.modal-overlay').hide()
  )

window.hide_thank_you = ->
  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()
