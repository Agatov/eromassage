$ ->
  $('.guestbook-post-comments').on 'click', '.delete-link', ->
    $(@).parent().hide(200)