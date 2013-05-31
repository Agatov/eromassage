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