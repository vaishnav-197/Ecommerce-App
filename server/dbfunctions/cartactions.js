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
        else{
            res.json({success:true , msg:'You are not authorized'})
        }

        
    },


    cartdetails: function(req , res){
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            
            User.find({email:decodedtoken.email}, function(err , prod){
                if (err) throw err
                if(prod){
                    console.log(prod[0].cart)
                    return res.json({success: true, prod:  prod[0].cart})

                }
            })
   
            
        }
        else{
            res.json({success:false , msg:'You are not authorized'})
        }
    },



    cartdelete: function(req,res){
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            
           
            User.update(
                {email:decodedtoken.email},
                {$pull: {cart : { prod: req.body.prod}}},
                { safe: true, multi:true },
                (err, obj) => {
                    if(err) throw err
                    if(obj){

                        console.log(obj)
                        res.json({success:'true ' , msg:'product removed'})
                    }

                })
            
          
            
             
            
        }
        else
        {
            res.json({success:false , msg:'You are not authorized'})
       
        }
    }





}


module.exports = cartfunctions