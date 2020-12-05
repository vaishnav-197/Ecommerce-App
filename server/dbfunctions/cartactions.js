var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')
var prod = require('../models/prod')

var cartfunctions = {
    
    addcart: function(req , res){
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            console.log(decodedtoken.email)
            
          User.update(
            { email:decodedtoken.email} ,
            { $push: {cart: { prod:req.body.prod,
                             qty:req.body.qty}}},
            (err , doc) =>{
                if(err){
                    res.json({success: false, msg:'couldnt save to cart'  })
                }
                else{
                    res.json({success: true, msg:' saved to cart'  })
                    console.log(doc)
                }
            }

          )
            
             
            
        }

        
    }





}


module.exports = cartfunctions