ready = ->
  client = new ZeroClipboard( $('#copy-btn') )

  client.on "ready", (readyEvent) ->
    client.on "aftercopy", (event) ->
      # `this` === `client`
      # `event.target` === the element that was clicked
      $(event.target).popover(
        content: 'Done',
        trigger: 'focus'
      ).popover('show')
      return

$(document).ready(ready)
$(document).on('page:load', ready)
