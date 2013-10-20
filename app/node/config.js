
exports.connect = function() {
        var mysql      = require('mysql');
        var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'pariouvert',
            password : '#pari0uvert#',
            database : 'pariouvert',
        });

        connection.connect();
        return connection;
}

