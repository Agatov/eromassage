$ ->

  $('.guestbook-post-comments__new-form').on 'submit', (event) ->
    event.preventDefault()
    post_id = $(@).attr('data-post-id')
    message = $(@).find('#comment_message')
    if message.val().length < 3
      message.addClass('message-empty-error')
      return false
    message.removeClass('message-empty-error')
    path = '/guestbook/posts/' + post_id + '/comments'
    $.post path, {'comment[message]': message.val()}, (comment) =>
      $(@).parent().parent().find('.guestbook-post-comments_list').append comment
      message.val('')

  $('#guestbook-next_page__link').bind 'ajax:success', (event, data) ->
    $('.guestbook-posts').append data
    href = $(@).attr 'href'
    href_arr =  href.split('=')
    path = href_arr[0] + '=' + (parseInt(href_arr[1]) + 1)
    $(@).attr 'href', path
