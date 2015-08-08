socket = io('http://localhost:5001')
socket.on 'connect', ->
  console.log "connect"
socket.on 'rt-change', (data) ->
  console.log data
socket.on 'disconnect', ->
  console.log "disconnect"
