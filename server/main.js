const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());



/*####################################################
 ********* Defining Routes (Restful APIs)************
 ####################################################*/
app.post('/register-tutor', async(req, res, next)=>{
  const FName = req.body.FName;
  const LName = req.body.LName;
  const email = req.body.email;
  const password = req.body.password;
  const phone_Num = req.body.phone_Num;
  var  response_conf = "";
  var  response_err = "";

const [rows] = await db.query("SELECT email FROM tutor WHERE email = ? ;", [email]);
 if( rows.length > 0){
  //response_err = "Email address already taken";
  res.json({status:"Email address already taken"});
  console.log("Email address already taken") 
  console.log(rows);
 }else{
  db.query("INSERT INTO tutor (email,password,FName,LName,P_Num) VALUES (?,?,?,?,?);",
  [email,password,FName,LName,phone_Num]);
  //response_conf = "Tutor registered successfully";
  res.json({confirm:"Tutor registered successfully"});
  console.log("Api-registerTutor reached");
 }
 //res.json({status:response_err});
 next();

});


app.post('/login-user', async(req, res, next)=>{
  /* const name = req.body.name;
 
   await db.query("INSERT INTO users (name) VALUES (?);", [name]);
 
   res.json({status:"OK"});
   next();*/
   console.log("Api-loginUser reached");
 });

app.get('/users', async (req, res, next) => {
/*  const [rows] = await db.query("SELECT * FROM users;");

  res.json(rows);
  next();*/
  console.log("Api-loginUser reached");
});
/*####################################################
####################################################*/






/*####################################################
 ********* Initializing Database Connection**********
 ####################################################*/
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
/*####################################################
####################################################*/

main();