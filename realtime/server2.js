var io, redis;

io = require('socket.io').listen(5001);

redis = require('redis').createClient();
