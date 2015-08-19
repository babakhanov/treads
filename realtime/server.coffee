sessionDecoder = require("rails-session-decoder");
io = require("socket.io")(5001)

sessionName = "_treads_session"
secret = "3fc387acd0767523f4ca4ea08093b3c25d579de7a802800f9d43999c24a8126027bbfe12f2b6fe209a1f1bf1402b71dd5bfe67ce06c4e3cf88ced81bbc972097"

decoder = sessionDecoder(secret);

currentSession = {}


getCookies = (_cookies) ->
  cookies = {}
  _cookies.replace(/[\n\s]+/g, "").split(";").map (c) ->
    _c = c.split("=")
    cookies[_c[0]] = _c[1]
  cookies
  

io.on "connection", (sock) ->
  cookies = getCookies(sock.handshake.headers.cookie)
  decoder.decodeCookie cookies[sessionName], (err, sessionData) ->
    currentSession = JSON.parse(sessionData)
    sock.emit "message", currentSession
