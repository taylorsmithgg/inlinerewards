$(document).ready ->

  trigger = $('.hamburger')
  overlay = $('.overlay')
  isClosed = false

  hamburger_cross = ->
    if isClosed == true
      #            overlay.hide();
      trigger.removeClass 'is-open'
      trigger.addClass 'is-closed'
      $('#inner-toggle').removeClass 'sr-only'
      isClosed = false
    else
      #            overlay.show();
      trigger.removeClass 'is-closed'
      trigger.addClass 'is-open'
      $('#inner-toggle').addClass 'sr-only'
      isClosed = true
    return

  trigger.click ->
    hamburger_cross()
    return
  $('[data-toggle="offcanvas"]').click ->
    $('#wrapper').toggleClass 'toggled'
    return
  trigger.click()
  return

  $btnSets = $('#responsive')
  $btnLinks = $btnSets.find('a')
  $btnLinks.click (e) ->
    $(this).siblings('a.active').removeClass 'active'
    $(this).addClass 'active'
    index = $(this).index()
    $('div.user-menu>div.user-menu-content').removeClass 'active'
    $('div.user-menu>div.user-menu-content').eq(index).addClass 'active'

  $('[rel=\'tooltip\']').tooltip()
  $('.view').hover (->
    $(this).find('.caption').slideDown 250
    #.fadeIn(250)
  ), ->
    $(this).find('.caption').slideUp 250
  #.fadeOut(205)