const database = require("../dataLogic/dbLogic");

const RegisterCity = async (req, resp)  => {
    resp.json(await database.RegisterCity(req.body));
}

module.exports = {
    RegisterCity
}