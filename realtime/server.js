// Generated by CoffeeScript 1.9.3
(function() {
  var clients, currentSession, currentUser, decoder, getCookies, io, redis, redisListener, secret, sessionDecoder, sessionName;

  sessionDecoder = require("rails-session-decoder");

  redis = require("redis");

  redisListener = redis.createClient();

  io = require("socket.io")(5001);

  sessionName = "_treads_session";

  secret = "3fc387acd0767523f4ca4ea08093b3c25d579de7a802800f9d43999c24a8126027bbfe12f2b6fe209a1f1bf1402b71dd5bfe67ce06c4e3cf88ced81bbc972097";

  decoder = sessionDecoder(secret);

  currentSession = {};

  currentUser = {};

  clients = {};

  redisListener.subscribe("message");

  getCookies = function(_cookies) {
    var cookies;
    cookies = {};
    _cookies.replace(/[\n\s]+/g, "").split(";").map(function(c) {
      var _c;
      _c = c.split("=");
      return cookies[_c[0]] = _c[1];
    });
    return cookies;
  };

  io.on("connection", function(socket) {
    var cookies;
    cookies = getCookies(socket.handshake.headers.cookie);
    return decoder.decodeCookie(cookies[sessionName], function(err, sessionData) {
      currentSession = JSON.parse(sessionData);
      currentUser.id = currentSession["warden.user.user.key"][0][0];
      if (currentUser.id > 0) {
        return clients[currentUser.id] = socket;
      } else {
        return socket.disconnect();
      }
    });
  });

  redisListener.on("message", function(channel, message) {
    var i, len, ref, response, results, u;
    response = JSON.parse(message).message_resp;
    ref = response.tread.users;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      u = ref[i];
      if (clients[u.id]) {
        results.push(clients[u.id].emit("message", response));
      } else {
        results.push(void 0);
      }
    }
    return results;
  });

}).call(this);
