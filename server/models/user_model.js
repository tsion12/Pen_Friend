module.exports = (sequelize, Sequelize)=>{
    const user = sequelize.define("app_user",{
        pen_name:{
            type: Sequelize.TEXT
        },
        email:{
            type: Sequelize.TEXT
        },
        password:{
            type: Sequelize.TEXT
        },
        number_of_mentors:{
            type: Sequelize.INTEGER
        },
        number_of_mentees:{
            type: Sequelize.INTEGER
        },
        group_id:{
            type: Sequelize.BIGINT
        },
        profile_id:{
            type: Sequelize.BIGINT
        },
        createdAt:{
            type: Sequelize.DATE
        },
        updateAt:{
            type: Sequelize.DATE
        }
    
    },
    {
        freezeTableName: true,
    }
    );
// CREATE EXTENSION IF NOT EXISTS pgcrypto;
    return user;
}

