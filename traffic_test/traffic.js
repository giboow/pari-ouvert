
var traffic = function() {

    var http = require('http');
    var options = {
	host: 'data.nantes.fr',
	port: 80,
	path: '/api/getTempsParcours/1.0/39W9VSNCSASEOGV/?output=json'
    };

    callback = function(response) {

	var data = '';

	response.on('data', function (chunck) {
	    data += chunck;
	});


	response.on('end', function () {

		try {
		    var json = JSON.parse(data);
		} catch (e) {
		    console.log("KO - exception JSON.parse()");
		    return false;
		}
		var date = new Date();

		if (json['opendata']
		    && json['opendata']['answer']
		    && json['opendata']['answer']['data']
		    && json['opendata']['answer']['data']['Itineraires'])
		    {
			json = json.opendata.answer.data.Itineraires;
    			var map = new Object();
			json['Itineraire'].forEach(function(a) {
				map[a['Identifiant']] = a['Temps'];
			});
			console.log(map);
			console.log("Traffic done");
		    }
		else
			console.log("Erreur webservice Traffic");
	    });
    }

    http.request(options, callback).end();
}

var main = function()
{
	traffic();	
}


main();
//    setInterval(main, 60000);

process.on('uncaughtException', function(err) {
	console.log("uncaughtException : " + err);
    });
