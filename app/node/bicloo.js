
var config			= require("./config");
var mysql			= config.connect();

var commitGain			= function (gain, bicloo_id, user_id, pari_id) {
    mysql.query('UPDATE pari_bicloo SET date_traite = now(), gain = ' + gain + ' WHERE id = ' + pari_id, function(err, rows, fields) {
        if (err) throw err;
    });
    mysql.query('UPDATE users SET gain = gain + ' + gain + ' WHERE id = ' + user_id, function(err, rows, fields) {
        if (err) throw err;
    });
};

var biclooCalcGain = function(user_id, id_bicloo, pari, theorique, mise, date_mise, pari_id) {
    mysql.query('SELECT id, size FROM bicloo WHERE id = ' + id_bicloo, function(err, rows, fields) {
        if (err) throw err;
        rows.forEach(function(line) {
            var size            = line["size"];
            var gain            = 0;
            var proximite       = 1 / (Math.abs(pari - theorique) + 1); // multiplicateur de proximité : égal=1, éloigné=0.0001

            if (Math.abs(pari - theorique) > 3)
                proximite = 0;

            gain = proximite                                            // multiplicateur de la proximité du pari
                * (size / 13)						// multiplicateur de la taille de la station (13 == plus petite station)
                * mise;                                                 // multiplicateur de la mise

            if (gain)
                gain += mise;                                           // on récupère la mise ;-)

            commitGain(gain, id_bicloo, user_id, pari_id);
        });
    });
}

var biclooBet = function(map) {
    mysql.query('SELECT * FROM pari_bicloo WHERE date_traite IS NULL AND date(now()) = date(date_pari) AND hour(now()) = hour(date_pari) AND minute(now()) = minute(date_pari)', function(err, rows, fields) {
	if (err) throw err;
	rows.forEach(function(line) {
	    biclooCalcGain(line['user_id'], line['bicloo_id'], line["nb_place_pari"], map[line["bicloo_id"]],  line["mise"], line["date_create"], line['id']);
	});
    });
}

var bicloo = function() {

    var http = require('https');
    var options = {
	host: 'api.jcdecaux.com',
	port: 443,
	path: '/vls/v1/stations?apiKey=aa9e0af352defa7b4e93c6360193764bbe7f6e6c'
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
		var map = new Object();
		json.forEach(function(a) {
			if (a.contract_name == "Nantes")
				map[a.number] = a.available_bikes;
		});
		biclooBet(map);
	    });
    }
    http.request(options, callback).end();
}

exports.load = function (timeUpdate) {
    setInterval(bicloo, timeUpdate);
    bicloo();
};
