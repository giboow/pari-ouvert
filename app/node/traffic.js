
var config		= require("./config");
var mysql		= config.connect();

var commitGain		= function (gain, troncon_id, user_id, pari_id) {
    mysql.query('UPDATE pari_traffic SET date_traite = now(), gain = ' + gain + ' WHERE id = ' + pari_id, function(err, rows, fields) {
	if (err) throw err;
    });
    mysql.query('UPDATE users SET gain = gain + ' + gain + ' WHERE id = ' + user_id, function(err, rows, fields) {
	if (err) throw err;
    });
};

var trafficCalcGain = function(user_id, id_troncon, pari, theorique, mise, date_mise, pari_id) {
    mysql.query('SELECT id FROM troncon WHERE id = ' + id_troncon, function(err, rows, fields) {
        if (err) throw err;
        rows.forEach(function(line) {
            var gain            = 0;
            var proximite       = 1 / (Math.abs(pari - theorique) + 1);		// multiplicateur de proximité : égal=1, éloigné=0.0001

            if (Math.abs(pari - theorique) > theorique / 3)
                proximite = 0;

            gain = proximite		                        // multiplicateur de la proximité du pari
		* 2						// multiplicateur pour avoir une équivalence entre les différents jeux de donénes
                * mise;                                         // multiplicateur de la mise

	    if (gain)
                gain += mise;                                   // on récupère la mise ;-)

            commitGain(gain, id_troncon, user_id, pari_id);
        });
    });

    commitGain();
}

var trafficBet = function(map) {
    mysql.query('SELECT * FROM pari_traffic WHERE date_traite IS NULL AND date(now()) = date(date_pari) AND hour(now()) = hour(date_pari) AND minute(now()) = minute(date_pari)', function(err, rows, fields) {
	if (err) throw err;
	rows.forEach(function(line) {
	    trafficCalcGain(line['user_id'], line['troncon_id'], line["tps_trajet_pari"], map[line["troncon_id"]],  line["mise"], line["date_create"], line['id']);
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
			    map[parseInt(a['Identifiant'])] = a['Temps'];
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
    traffic();
};
