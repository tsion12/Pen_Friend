const express = require("express"); 
const app = express();
const pool = require('./db');
var jwt = require('jsonwebtoken');

app.use(express.json());
app.listen(5000, () => {
    console.log("listening on port 5000....");
});

// login server
app.post('/login/', async(req,res)=>{
try {

    const { email , password } = req.body;

    const response = await pool.query(
        "SELECT * FROM app_user WHERE  email = $1 AND password = crypt($2 , password);",
        [email,password]
    );
    if(response.rowCount == 0){
        console.log('invalid login');
        return res.status(400).send('invalid login');
    
    }
    console.log('login successful');
    var user_id = response.rows[0].id;
    var token = jwt.sign({id: user_id} , 'paswd');
    console.log(token);
    return res.json({token:token});
    
} catch (error) {
    console.error(error.message);
}
    
 
});
//sign up server
app.post('/signup/',async(req , res) =>{
    try {
       const { penName , email , password } = req.body;
    
       const result = await pool.query(
           "SELECT * FROM app_user WHERE email = $1", 
           [email]);
           if (result.rows != ''){///////////////////////////???????????????????????????????????????
            return res.status(400).send('the email already exists'+result.rows);
    
              // return res.json("the email already exists  "+result.rows);

           }
       const newUser = await pool.query(
           "INSERT INTO app_user (pen_name,email,password) VALUES ($1,$2,crypt($3,gen_salt('bf'))) RETURNING *", 
           [penName , email , password ]
           );
       console.log('sign up succesfull');
       return res.status(201).json(newUser);
    
    
    
    
    } catch (error) {
        console.error(error.message);
        //throw(error);
    } 
    });
    