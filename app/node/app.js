
var parkingDaemon	= require("./parkings");
var trafficDaemon	= require("./traffic");

var timeUpdate		= 60000;

parkingDaemon.load(timeUpdate);
trafficDaemon.load(timeUpdate);

process.on('uncaughtException', function(err) {
    console.log("uncaughtException : " + err);
});
