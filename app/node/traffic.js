
var config		= require("./config");
var mysql		= config.connect();

var trafficCalcGain = function(parie, theorique, mise, date_mise) {
	if (parie == theorique) {
		console.log("C'est gagné");
		return mise * 2;
	}
	console.log(parie + ' ' + theorique);
	return 0;
}

var trafficBet = function(map) {
	mysql.query('SELECT * FROM pari_traffic WHERE date_traite IS NULL AND date(now()) = date(date_pari) AND hour(now()) = hour(date_pari) AND minute(now()) = minute(date_pari)', function(err, rows, fields) {
		if (err) throw err;
		rows.forEach(function(line) {
			gain = trafficCalcGain(line["tps_trajet_pari"], map[line["troncon_id"]],  line["mise"], line["date_create"]);
			mysql.query('UPDATE pari_traffic SET date_traite = now(), gain = '+gain+ ' WHERE id = ' + line['id'], function(err, rows, fields) {
				if (err) throw err;
			});
			mysql.query('UPDATE users SET gain = gain + '+gain+' WHERE id = ' + line['user_id'], function(err, rows, fields) {
				if (err) throw err;
			});
		});
	});
}

var traffic = function() {

    var http = require('http');
    var options = {
	host: 'data.nantes.fr',
	port: 80,
	path: '/api/getTempsParcours/1.0/QWZ0V8G15EO65QL/?output=json'
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

		if (json['opendata']
		    && json['opendata']['answer']
		    && json['opendata']['answer']['data']
		    && json['opendata']['answer']['data']['Itineraires'])
		    {
			json = json.opendata.answer.data.Itineraires.Itineraire;
    			var map = new Object();
			json.forEach(function(a) {
			    map[a['Identifiant']] = a['Temps'];
			});
			trafficBet(map);
			console.log("Traffic done");
		    }
		else
			console.log("Erreur webservice Traffic");
	    });
    }
    http.request(options, callback).end();
}

exports.load = function (timeUpdate) {
    setInterval(traffic, timeUpdate);
};
