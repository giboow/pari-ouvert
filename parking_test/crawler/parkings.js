

var pushDataCouchDB = function(data) {

    var http = require('http');

    var request = new http.ClientRequest({
	host: '127.0.0.1',
	port: 5984,
	path: '/parkings_nantes',
	method: 'post',
	headers: {
            "Content-Type": "application/json",
	}
    });

    request.on("error", function(er) {
	console.log("exception 3 catched : " + er);
    });

    request.end(data);
}

var main = function()
{
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
			json['timestamp'] = {
			    'timestamp': date.getTime(),
			    'year': date.getFullYear(),
			    'month': date.getMonth() + 1,
			    'day': date.getDate(),
			    'hour': date.getHours(),
			    'minutes': date.getMinutes(),
			    'seconds': date.getSeconds(),
			};

			var str = JSON.stringify(json);

			pushDataCouchDB(str);
			//console.log(str);
			console.log("OK");
		    }
		else
		    {
			console.log("KO");
		    }
	    });
    }

    http.request(options, callback).end();
}


//main();
    setInterval(main, 60000);

process.on('uncaughtException', function(err) {
	console.log("uncaughtException : " + err);
    });
