$ ->

  $('.get-call').bind 'click', ->
    dialog = $('.request-call-dialog')

    # Координаты, чтобы окошко как бы выезжало из-за правого края экрана
    first_left = $(document).width() + 400
    last_left = $(@).offset().left - (dialog.width() - $(@).width())

    # Задаем начальную позицию и отключаем невидимость
    dialog.css 'left', "#{first_left}px"
    dialog.css 'top', '50px'
    dialog.css 'opacity', '0'
    dialog.show()

    # Анимируем движение ко второй координате
    dialog.animate({left: "#{last_left}px", opacity: '1'}, 300)


    # Если body ловит событие клика, то значит открыт диалог и его нужно скрыть
    $('body').bind 'click', ->

      hideDialog()

      # Напоследок анбиндим событие кликам по body
      $('body').unbind 'click'

    # А это сделано для того, чтобы клики по формы не выстреливали событие click у body
    $('.request-call-dialog').bind 'click', ->
      false

    false

  $('.nav-link').bind 'click', ->
    position = $("##{$(@).attr('rel_id')}").offset().top
    $('body').animate({scrollTop: "#{position - 75}px"}, 300)
    false



window.hideDialog = ->

  dialog = $(".request-call-dialog")

  # 998, потому что у топбара - 999. Это нужно для заезжания диалога под топбар
  dialog.css 'z-index', '998'

  # И вот путем такого простого эффекта диалог "уезжает" наверх экрана
  dialog.animate({top: '-400px', opacity: '0'}, 300, ->
    dialog.hide()
    $(".success").hide()
    $("form").show()
  )