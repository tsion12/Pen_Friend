const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "chimchimx",
    database: "pen_pal",
    host: "localhost",
    port: 5432
});

module.exports = pool;