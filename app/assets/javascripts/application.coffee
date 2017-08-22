#= require jquery
#= require jquery_ujs
#= require bootstrap/transition
#= require bootstrap/collapse
#= require bootstrap/tooltip
#= require alertify
#= require react
#= require react_ujs
#= require components

# Preloader 
window.onload = -> $('.preloader').addClass('done')

# Set default options for AlertifyJS
alertify.defaults.theme.ok = 'btn btn-sm btn-primary'
alertify.defaults.theme.cancel = 'btn btn-sm btn-link'
alertify.defaults.theme.input = 'form-control input-sm'
alertify.defaults.theme.input = 'form-control input-sm'
alertify.set('alert', 'title', 'Alert')
alertify.set('confirm', 'title', 'Confirm')
alertify.set('confirm', 'reverseButtons', true)
alertify.set('notifier', 'position', 'top-right')

# Modal for forms
alertify.dialog 'modalForm', ->
  main: (title, selector, onok, oncancel) ->
    @$form = $(selector).removeClass('hidden')
    @setContent(@$form[0])
    @set('title', title)
    @set('onok', onok)
    @set('oncancel', oncancel)

  setup: ->
    buttons: [
      { 
        text: 'Cancel'
        key: 27
        invokeOnClose: true
        className: alertify.defaults.theme.cancel
      }
      {
        text: 'Save'
        className: alertify.defaults.theme.ok
      }
    ]
    focus:
      element: 0
      select: false
    options:
      resizable: false
      padding: false
      movable: false
      pinnable: false

  settings:
    onok: null
    oncancel: null

  prepare: ->
    @__internal.buttons[1].element

  callback: (closeEvent) ->
    switch closeEvent.index
      when 0
        if typeof @get('oncancel') is 'function'
          returnValue = @get('oncancel').call(@, closeEvent)
          closeEvent.cancel = !returnValue if typeof returnValue isnt 'undefined'

      when 1
        if typeof @get('onok') is 'function'
          returnValue = @get('onok').call(@, closeEvent)
          closeEvent.cancel = !returnValue if typeof returnValue isnt 'undefined'

  hooks: onclose: -> 
    setTimeout (=> @$form.addClass('hidden').appendTo('body')), 500

# Register a handler to be called when Ajax requests complete with an error
$(document).ajaxError (e, xhr, settings, thrownError) ->
  response = xhr.responseJSON

  alertify.error(
    if typeof response is 'object' 
      if response.errors? and Array.isArray(response.errors)
        response.errors.map((error) -> error).join('<br>')
      else if response.error?
        response.error
    else
      xhr.responseText.replace(/\n/g, '<br>')
  )

# Init bootstrap tooltip
$('body').tooltip selector: '[data-toggle="tooltip"]'
