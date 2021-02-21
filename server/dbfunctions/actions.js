var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

const chalk = require('chalk')


var functions = {
    addNew: function (req, res) {

                    name = req.body.name
                    password = req.body.password
                    email = req.body.email
                    phone = req.body.phone
                    password1 = req.body.password1
        
        if ((!name) || (!password) ||  (!email) || (!phone)) {
            res.json({success: false, msg: 'Enter all fields'})
            console.log('all feilds req')
        }
        if (password.length < 6){
            res.json({success: false, msg: 'Password length less than 6'})
            console.log('len less than 6')
        }
        if (password != password1){
            res.json({success: false, msg: 'Passwords doesnot match'})
            console.log('no match passwords')
            
        }
        

        if(email){
            
            User.findOne(
                {email:email}
            ).then(user =>{
                if(user){
                    res.json({success: false, msg: 'email id already taken'})
                    console.log('email taken')
                }
            else{
                var newUser = User({
                    name: name,
                    password: password,
                    email: email,
                    phone: phone,
                    
                });
                newUser.save(function (err, newUser) {
                    if (err) {
                        res.json({success: false, msg: 'Failed to save'})
                        console.log('failed to save ')
                    }
                    else {
                        res.json({success: true, msg: 'Successfully saved'})
                        console.log('saved success')
                    }
                })
            }})
            .catch(err => console.log(err))
                
                }
        
    },
    authenticate: function (req, res) {
        User.findOne({
            email: req.body.email
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
                    console.log('auth failed')
                }

                else {
                    user.comparePassword(req.body.password, function (err, isMatch) {
                        if (isMatch && !err) {
                            var token = jwt.encode(user, config.secret)
                            res.json({success: true, token: token})
                        }
                        else {
                            return res.status(403).send({success: false, msg: 'Authentication failed, wrong password'})
                        }
                    })
                }
        }
        )
    },
    dash: function (req, res) {
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            
            
             prod.find({}, function(err , prod){
                if (err) throw err
                if(prod){
                    console.log(chalk.blue(decodedtoken.email)+' logged in')
                    return res.json({success: true, prod:  prod })

                }
            })
            
            // console.log(listprod)
            
        }
        else {
            return res.json({success: false, msg: 'Not Authorized :('})
        }
    }
    
}

module.exports = functions