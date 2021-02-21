
const express = require('express')
const cors = require('cors')
const dbConfig = require('./config/dbconfig')
const mongoose = require('mongoose')
const passport = require('passport')
const bodyParser = require('body-parser')
const chalk = require('chalk')


// Routes
const routes = require('./routes/route')
const adminroutes = require('./routes/adminroute')
const { bold } = require('chalk')



const app = express();






//    connect to mongoose
mongoose
  .connect(
    dbConfig.Userdb,
    {   useNewUrlParser: true ,
        useUnifiedTopology: true,
        useFindAndModify: false
    }
  )
  .then(() => console.log(chalk.bgYellow.black.bold.underline('MongoDB Userdb Connected')))
  .catch(err => console.log(err));




app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use('/',routes);
app.use('/admin',adminroutes);

app.use(passport.initialize())
require('./config/passport')(passport)
const PORT = process.env.PORT || 4000;

app.listen(PORT, () => {
 console.log(chalk.bgGray.bold.blue(`Server running on port ${PORT}`));
});