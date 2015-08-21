window.socket = io("http://localhost:5001")

window.socket.on "connect", ->
  console.log "connect"

window.socket.on "disconnect", ->
  console.log "disconnect"
