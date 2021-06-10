const bcrypt = require('bcryptjs');
const mysql = require("mysql2/promise");
const  express = require('express');
const app = express();


app.post('/create-user', async(req, res, next)=>{
    /* const name = req.body.name;
   
     await db.query("INSERT INTO users (name) VALUES (?);", [name]);
   
     res.json({status:"OK"});
     next();*/
     console.log("Api reached");
   });
   app.get('/users', async (req, res, next) => {
     const [rows] = await db.query("SELECT * FROM users;");
   
     res.json(rows);
     next();
     console.log("user retrieved");
   });
   
   async function main(){
     console.log("connecting Mysql");
     db = await mysql.createConnection({
       host:"localhost",
       user: "root",
       password: "",
       database: "easytuitions",
       timezone: "+00:00",
       charset: "utf8mb4_general_ci",
     });
     console.log("Mysql connected");
   
     app.listen(8020);
   }