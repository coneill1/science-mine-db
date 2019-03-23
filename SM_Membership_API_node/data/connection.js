const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'sm_admin',
    password: 'ScienceMine',
    database: 'SM_Membership'
});

connection.connect(err => {
    if (err) {
        console.log(err);
        throw err;
    }

    console.log('connected!!');
});

module.exports = connection;
