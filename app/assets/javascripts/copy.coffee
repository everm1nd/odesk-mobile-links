ready = ->
  client = new ZeroClipboard( $('#copy-btn') )

$(document).ready(ready)
$(document).on('page:load', ready)
