
var parking = function() {

    var http = require('http');
    var options = {
	host: 'data.nantes.fr',
	port: 80,
	path: '/api/getDisponibiliteParkingsPublics/1.0/QWZ0V8G15EO65QL/?output=json'
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
		    && json['opendata']['answer']['data']['Groupes_Parking'])
		    {
			json = json.opendata.answer.data.Groupes_Parking;
    			var map = new Object();
			json['Groupe_Parking'].forEach(function(a) {
				map[a['Grp_nom']] = a['Grp_disponible'];
			});
			console.log(map);
			console.log("Parking done");
		    }
		else
			console.log("Erreur webservice Parking");
	    });
    }

    http.request(options, callback).end();
}

var main = function()
{
	parking();	
}


main();
//    setInterval(main, 60000);

process.on('uncaughtException', function(err) {
	console.log("uncaughtException : " + err);
    });
