$ ->
  $(document).on 'ajax:success', '.girl-modal-comments__new form', (e, data) ->
    wrapper = $(@).closest('.girl-modal-comments')
    wrapper.find('.girl-modal-comments__list').append(data)
    $(@).find('input[type=text]').val('')
    scroll = wrapper.find('.girl-modal-comments__list').get(0).scrollHeight - 440
    wrapper.find('.girl-modal-comments__list').animate({'scrollTop': scroll}, 'slow')

  
  $('.girls .girl .avatar').bind 'click', ->
    girl_id = $(@).closest('.girl').attr 'data-girl-id'
    selector = '#girl-modal-' + girl_id
    $(selector).addClass 'girl-modal-show'

  $('.girls .modals .girl-modal-overlay').bind 'click', ->
    $('.girls .modals .girl-modal').removeClass 'girl-modal-show'
