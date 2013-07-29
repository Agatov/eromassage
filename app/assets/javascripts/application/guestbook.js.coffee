$ ->
  $('.guestbook-post-comments__new-form').submit (event) ->
    event.preventDefault()
    post_id = $(@).attr('data-post-id')
    message = $(@).find('#comment_message')
    path = '/guestbook/posts/' + post_id + '/comments'
    $.post path, {'comment[message]': message.val()}, (comment) =>
      $(@).parent().parent().find('.guestbook-post-comments_list').append comment
      message.val('')