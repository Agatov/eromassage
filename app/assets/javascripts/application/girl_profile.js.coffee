$ ->


  $(document).on 'click', '.preview', ->
    photo_id = $(@).attr('photo_id')
    hideCurrentPhoto()
    photo = $(".photo[photo_id=#{photo_id}]")
    makeCurrent(photo)


  $('.photo').on 'click', ->
    showNextPhoto()



  $('.girl .avatar').bind 'click', ->


    $(".modal").append $(@).parent().find(".modal-template").html()
    showFirstPhoto()

    $('.overlay').show()

    $('.overlay').animate {opacity: 1}, 500, ->
      $('.modal-wrapper').show('slide', {direction: 'top'})



  $('#close-modal').bind 'click', ->

    $('.modal-wrapper').hide 'slide', {direction: 'left'}, ->
      $('.overlay').animate {opacity: 0}, 500, ->
        $('.overlay').hide()
        $('.modal').html('')


    false

  window.current_photo = null



window.showFirstPhoto = ->
  current_photo = $("#girl-photos .photo").first()
  current_photo.show()
  current_photo.attr('current', 'true')

window.showNextPhoto = ->
  current_photo = $('.photo[current=true]')
  next_photo = $('.photo[current=true] ~ .photo').first()
  current_photo.removeAttr('current')
  current_photo.hide()
  next_photo.show()
  current_photo = next_photo
  current_photo.attr('current', 'true')


window.makeCurrent = (photo) ->
  photo.attr('current', 'true')
  photo.show()

  photo_id = photo.attr('photo_id')
  $(".preview[photo_id=#{photo_id}]").addClass('active')

window.getCurrentPhoto = ->
  $('.photo[current=true]')

window.hideCurrentPhoto = ->
  photo = getCurrentPhoto()
  photo.hide()
  photo.removeAttr('current')
  $(".preview.active").removeClass('active')