chat_is = 'rt-change'

socket = io('http://localhost:5001')
socket.on 'connect', ->
  console.log "connect"
socket.on chat_is, (data) ->
  console.log data
socket.on 'disconnect', ->
  console.log "disconnect"
