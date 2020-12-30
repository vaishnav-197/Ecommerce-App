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

// POST to add products to cart
router.post('/cart/add', cartactions.addcart)


// GET cart details 
router.get('/cart/items' , cartactions.cartdetails)


// POST delete items from cart
router.post('/cart/delete' , cartactions.cartdelete)
module.exports = router