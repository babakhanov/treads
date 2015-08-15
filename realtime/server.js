var io, redis;

io = require('socket.io').listen(5001);

redis = require('redis').createClient();

redis.subscribe('message');

io.on('connection', function(socket) {
  redis.on('message', function(channel, message) {
    var response = JSON.parse(message).message;
    socket.emit('tread_' + response.tread_id, response);
  });
});

