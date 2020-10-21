var mqtt = require('mqtt');
var client = mqtt.connect('52.79.73.78:1883');

client.on('connect', function () {
    client.subscribe('/moter');
    client.publish('/moter', 'on');
});

client.on('message', function (topic, message) {
    // message is Buffer
    console.log(message.toString());
    client.end();
});