const mongoose = require('mongoose')
var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')
var prod = require('../models/prod')
var functions = {
    addNew: function (req, res) {
        if ((!req.body.name) || (!req.body.password) ||  (!req.body.email) || (!req.body.phone)) {
            res.json({success: false, msg: 'Enter all fields'})
        }
        else {
            var newUser = User({
                name: req.body.name,
                password: req.body.password,
                email: req.body.email,
                phone: req.body.phone
            });
            newUser.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'})
                }
            })
        }
    },
    authenticate: function (req, res) {
        User.findOne({
            name: req.body.name
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
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
            

            p = []
            var listprod = prod.find({}, function(err , prod){
                if (err) throw err
                if(prod){
                    
                    return res.json({success: true, prod:  prod })

                }
            })
            
            // console.log(listprod)
            
        }
        else {
            return res.json({success: false, msg: 'No Headers'})
        }
    }
}

module.exports = functions