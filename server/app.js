
const express = require('express')
const cors = require('cors')
const dbConfig = require('./config/dbconfig')
const mongoose = require('mongoose')
const passport = require('passport')
const bodyParser = require('body-parser')
const routes = require('./routes/route')



const app = express();






//    connect to mongoose
mongoose
  .connect(
    dbConfig.database,
    {   useNewUrlParser: true ,
        useUnifiedTopology: true,
        useFindAndModify: false
    }
  )
  .then(() => console.log('MongoDB Connected'))
  .catch(err => console.log(err));


app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use('/',routes);
app.use(passport.initialize())
require('./config/passport')(passport)

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
 console.log("Server running on port 3000");
});


// mongodb+srv://<username>:<password>@cluster0.re9du.mongodb.net/<dbname>?retryWrites=true&w=majority