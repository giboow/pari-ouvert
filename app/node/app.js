var parkingDaemon	= require("./parkings");
var trafficDaemon	= require("./traffic");
var biclooDaemon	= require("./bicloo");

var timeUpdate		= 60000;

parkingDaemon.load(timeUpdate);
trafficDaemon.load(timeUpdate);
biclooDaemon.load(timeUpdate);

process.on('uncaughtException', function(err) {
    console.log("uncaughtException : " + err);
});
