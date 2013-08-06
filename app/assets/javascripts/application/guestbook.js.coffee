$ ->

  $('.guestbook-post-comments__new-form')
    .bind 'ajax:success', (event, data) ->
      message = $(@).find('#comment_message')
      message.removeClass('message-empty-error')
      $(@).parent().parent().find('.guestbook-post-comments_list').append data
      $(@).find('#comment_message').val ''
    .bind 'ajax:error', (event, data) ->
      message = $(@).find('#comment_message')
      message.addClass('message-empty-error')

  $('#guestbook-next_page__link').bind 'ajax:success', (event, data) ->
      $('.guestbook-posts').append data
      href = $(@).attr 'href'
      href_arr =  href.split('=')
      path = href_arr[0] + '=' + (parseInt(href_arr[1]) + 1)
      $(@).attr 'href', path