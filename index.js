const express = require("express");
const cors = require("cors");
const bodyParser = require('body-parser');
require("dotenv").config();

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors())
app.use(express.static("public"));

app.use(express.json());

app.use("/api/auth", require("./routes/auth"));
app.use("/api/city", require("./routes/city"));
app.use("/api/site", require("./routes/site"));

app.listen(process.env.PORT, () => {
    console.log(`Service running in port ${ process.env.PORT }`);
});