const database = require("../dataLogic/dbLogic");

const RegisterSite = async (req, resp)  => {
    resp.json(await database.RegisterSite(req.body));
}

const GetUsersBySite = async (req, resp)  => {
    resp.json(await database.GetUsersBySite(req.params.idSite));
}

module.exports = {
    RegisterSite,
    GetUsersBySite
}