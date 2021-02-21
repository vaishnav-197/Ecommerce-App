const express = require('express')
const actions = require('../dbfunctions/adminactions')
const cartactions = require('../dbfunctions/cartactions')
const router = express.Router()


// POST /adduser
router.post('/addnew', actions.addNewAdmin)

// POST /authenticate
router.post('/authenticate', actions.authenticate)







module.exports = router