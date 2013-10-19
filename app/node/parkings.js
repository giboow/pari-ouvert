var connection = function() {
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	    host     : 'localhost',
	    user     : 'startup',
	    password : 'secret',
	    database : 'pariouvert',
	});

	connection.connect();
	return connection;
}

var mysql = connection();

var parkingCalcGain = function(parie, theorique, mise, date_mise) {
	if (parie == theorique) {
		return mise * 2;
	}
	return 0;
}

var parkingBet = function(map) {
	mysql.query('SELECT * FROM pari_parking WHERE date_traite IS NULL AND date(now()) = date(date_pari) AND hour(now()) = hour(date_pari) AND minute(now()) = minute(date_pari)', function(err, rows, fields) {
		if (err) throw err;
		rows.forEach(function(line) {
			gain = parkingCalcGain(line["nb_place_pari"], map[line["parking_id"]],  line["mise"], line["date_create"]);	
			mysql.query('UPDATE pari_parking SET date_traite = now(), gain = '+gain+ ' WHERE id = ' + line['id'], function(err, rows, fields) {
				if (err) throw err;		
			});
			mysql.query('UPDATE users SET gain = gain + '+gain+' WHERE id = ' + line['user_id'], function(err, rows, fields) {
				if (err) throw err;
			});
		});
		
	});
}

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
    			var map2 = new Object();
			json['Groupe_Parking'].forEach(function(a) {
				map[a['Grp_identifiant']] = a['Grp_disponible'];
			console.log(a['Grp_nom'] + '\t\t' + a['Grp_identifiant']);
			});
			parkingBet(map);
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
setInterval(main, 60000);

process.on('uncaughtException', function(err) {
	console.log("uncaughtException : " + err);
    });
