sessionDecoder = require("rails-session-decoder")
redis = require("redis").createClient()
io = require("socket.io")(5001)

sessionName = "_treads_session"
secret = "3fc387acd0767523f4ca4ea08093b3c25d579de7a802800f9d43999c24a8126027bbfe12f2b6fe209a1f1bf1402b71dd5bfe67ce06c4e3cf88ced81bbc972097"

decoder = sessionDecoder(secret)
currentSession = {}
currentUser = {}
clients = {}
redis.subscribe("message")


#dirty hack to get a cookies without modules
getCookies = (_cookies) ->
  cookies = {}
  _cookies.replace(/[\n\s]+/g, "").split(";").map (c) ->
    _c = c.split("=")
    cookies[_c[0]] = _c[1]
  cookies

io.on "connection", (socket) ->
  cookies = getCookies(socket.handshake.headers.cookie)
  decoder.decodeCookie cookies[sessionName], (err, sessionData) ->
    currentSession = JSON.parse(sessionData)
    currentUser.id = currentSession["warden.user.user.key"][0][0]
    socket.emit "message", currentSession
    if currentUser.id > 0
      clients[currentUser.id] = socket #push to list of a connected clients
    else
      socket.disconnect() #otherwise disconnect a client

redis.on "message", (channel, message) ->
  response = JSON.parse(message).message_resp
  for u in response.tread.users
    clients[u.id].emit "message", response if clients[u.id]

