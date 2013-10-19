
exports.connect = function() {
        var mysql      = require('mysql');
        var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'root',
            password : 'azerty1',
            database : 'pariouvert',
        });

        connection.connect();
        return connection;
}

