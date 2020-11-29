const express = require('express')
const actions = require('../dbfunctions/actions')
const router = express.Router()


// POST /adduser
router.post('/adduser', actions.addNew)

// POST /authenticate
router.post('/authenticate', actions.authenticate)


// GET /dashboard
router.get('/dash', actions.dash)




module.exports = router