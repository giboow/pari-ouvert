
var config			= require("./config");
var mysql			= config.connect();

var biclooCalcGain = function(parie, theorique, mise, date_mise) {
	if (parie == theorique) {
		return mise * 2;
	}
	return 0;
}

var biclooBet = function(map) {
	mysql.query('SELECT * FROM pari_bicloo WHERE date_traite IS NULL AND date(now()) = date(date_pari) AND hour(now()) = hour(date_pari) AND minute(now()) = minute(date_pari)', function(err, rows, fields) {
		if (err) throw err;
		rows.forEach(function(line) {
			gain = biclooCalcGain(line["nb_place_pari"], map[line["bicloo_id"]],  line["mise"], line["date_create"]);	
			mysql.query('UPDATE pari_bicloo SET date_traite = now(), gain = '+gain+ ' WHERE id = ' + line['id'], function(err, rows, fields) {
				if (err) throw err;		
			});
			mysql.query('UPDATE users SET gain = gain + '+gain+' WHERE id = ' + line['user_id'], function(err, rows, fields) {
				if (err) throw err;
			});
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
};
