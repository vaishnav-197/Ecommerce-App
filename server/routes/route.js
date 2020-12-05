const express = require('express')
const actions = require('../dbfunctions/actions')
const cartactions = require('../dbfunctions/cartactions')
const router = express.Router()


// POST /adduser
router.post('/adduser', actions.addNew)

// POST /authenticate
router.post('/authenticate', actions.authenticate)


// GET /dashboard
router.get('/dash', actions.dash)

router.post('/cart/add', cartactions.addcart)


module.exports = router