const express = require('express');
const Sequelize = require('sequelize');
var jwt = require('jsonwebtoken');
const db = require('../config/database');

const user = db.user;
const router = express();

router.use(express.json());
router.use(express.Router());

router.post('/',async (req, res) => {
   const { email , password } = req.body;
    const result = await user.findOne({ 
        where: { email: email},
        attributes: [
            'id',
            'pen_name',
            'email',
            [
                Sequelize.fn('PGP_SYM_DECRYPT',Sequelize.cast(Sequelize.col('password'),'bytea'),'AES_KEY'),
                'password',
            ],
            'number_of_mentors',
            'number_of_mentees',
            'group_id',
            'profile_id',
        ],
    }).catch(err=>{
        console.log(err.message);
    });
    if (result === null || result.password!=password ) {
        return res.status(400).send('login failed ');
    }else{
        
        var user_id = result.id;
        var token = jwt.sign({id: user_id},'paswd');
        console.log(`login succesfull   \n${result}\n${token}`);
        
        return res.status(201).json({user_data: result , token: token});
    }
    
 


});

module.exports =router;