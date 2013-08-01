$ ->
  $(document).on 'ajax:success', '.delete-comment__link', ->
    $(@).parent().hide(200)