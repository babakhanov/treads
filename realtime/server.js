var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();
console.log("Im working xoxo");

redis.subscribe('rt-change');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    console.log("redis on message");
    socket.emit('rt-change', JSON.parse(message));
  });
});

