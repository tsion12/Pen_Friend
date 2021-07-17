const express = require('express');
const Sequelize = require('sequelize');
const db = require('../config/database');

const user = db.user;
const router = express();

router.use(express.json());
router.use(express.Router());

router.post('/',async (req, res) => {
   const { pen_name , email , password } = req.body;
    //checking if email already exists
    const result = await user.findOne({ where: { email: email } }).catch(err=>{
        console.log(err.message);
    });
    if (result != null) {
        return res.status(400).send('the email already exists   '+result.email);
    }else{

        const newUser =await user.create({
            pen_name: pen_name,
            email: email,
            password: Sequelize.fn('PGP_SYM_ENCRYPT',password,'AES_KEY'),
        }).catch(err =>{
            console.log(err);
            res.json({msg: 'Error', detail: err});
    
        });
        console.log('sign up succesfull');
        return res.status(201).json(newUser);
    }
    
 


});

module.exports =router;