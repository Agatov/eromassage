$ ->

  $('.post-wrapper .post-comments-new form')
    .bind 'ajax:success', (event, data) ->
      message = $(@).find('#comment_message')
      message.removeClass('message-empty-error')
      $(@).parent().parent().find('.post-comments-list').append data
      $(@).find('#comment_message').val ''
    .bind 'ajax:error', (event, data) ->
      message = $(@).find('#comment_message')
      message.addClass('message-empty-error')