
const express = require('express');
const db = require('./config/database');
const path = require('path');
const sequelize = require('sequelize');

const app = express();

app.use('/signup', require('./routes/signup'));
app.use('/login',require('./routes/login'));

const PORT =process.env.PORT || 5000;

app.listen(PORT,console.log(`server listening on port: ${PORT} ....`));
let test_db_connection = async() =>{
  try {
    await db.sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }  
}
test_db_connection();


