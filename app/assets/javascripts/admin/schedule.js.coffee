jQuery ->
  $('.girl-schedule__table-mini td input').change ->
    status = @.checked
    if status is true
      $(@).parent().addClass 'schedule__green-bg'
    else
      $(@).parent().removeClass('schedule__green-bg')
