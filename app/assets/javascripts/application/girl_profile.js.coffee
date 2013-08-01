$ ->

  waitForMap ->
    @map = new ymaps.Map($("#map")[0], {center: [55.7990, 37.54527], zoom: 15})

#    balloon = new ymaps.Balloon(@map, null, {
#      contentLayout: '<div style="background: #fff; width: 400px; height: 300px;">asdasdasdasd</div>'
#    })
#    balloon.options.setParent(@map.options)
#    balloon.open(@map.getCenter())

    balloonLayout = ymaps.templateLayoutFactory.createClass('$[properties.content]')
    ymaps.layout.storage.add('place#balloonLayout', balloonLayout)

    placemark = new ymaps.Placemark(
      [55.798154, 37.54527],
    {
      content: $("#balloon-template").html()
    },
    {
      balloonAutoPan: false,
      hideIconOnBalloonOpen: true,
      balloonShadow: false,
      balloonLayout: "place#balloonLayout",
#      iconImageHref: '/assets/marker_empty.png',
      iconImageSize: [32, 32],
      iconImageOffset: [-20, -30]
    }
    )

    @map.geoObjects.add placemark

    placemark.balloon.open()


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


  $('.modable').bind 'click', ->

    console.log $(@).parent().find(".modal-template").html()


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

  # переключалка с фоток на комментарии и обратно
  $(document).on 'click', '.content-links a', (e) ->
    e.preventDefault()
    type = $(@).attr 'data-type'
    switch type
      when 'photos'
        $(@).parent().find('a[data-type=comments]').removeClass 'active'
        $(@).addClass 'active'
        $(@).closest('.content-wrapper').find('.comments-wrapper').hide()
        $(@).closest('.content-wrapper').find('.gallery').show()
      when 'comments'
        $(@).parent().find('a[data-type=photos]').removeClass 'active'
        $(@).addClass 'active'
        $(@).closest('.content-wrapper').find('.gallery').hide()
        $(@).closest('.content-wrapper').find('.comments-wrapper').show()

  $(document).on 'ajax:success', '.modal .comment__new form', (e, data) ->
    wrapper = $(@).closest('.comments-wrapper')
    wrapper.find('.comments').append(data)
    $(@).find('input[type=text]').val('')
    scroll = wrapper.get(0).scrollHeight - 500
    wrapper.animate({'scrollTop': scroll}, 'slow')

  $(document).on 'click', '#test', ->
    alert $('.gallery').top()

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


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )