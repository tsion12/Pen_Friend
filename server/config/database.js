const Sequelize = require('sequelize');
const sequelize = new Sequelize('pen_pal', 'postgres','chimchimx', {
    host: 'localhost',
    dialect: 'postgres',
    operatorAliases: false,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
  });
 

  const db = {};
 
  db.Sequelize = Sequelize;
  db.sequelize = sequelize;
   
  db.user = require('../models/user_model')(sequelize, Sequelize);
   
  module.exports = db;