#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require alertify
#= require react
#= require react_ujs
#= require components

# Preloader 
window.onload = -> $('.preloader').addClass('done')

# Set default position for AlertifyJS
alertify.set('notifier','position', 'top-right')

# Register a handler to be called when Ajax requests complete with an error
$(document).ajaxError (e, xhr, settings, thrownError) ->
  message = xhr.responseJSON.errors.map (error) -> error
  alertify.error message.join('<br>')
