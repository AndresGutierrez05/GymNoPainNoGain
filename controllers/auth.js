const database = require("../dataLogic/dbLogic");
const tokenUtility = require("../utilities/token");

const ValidateUser = async (req, resp)  => {
    const userLogged = await database.LogIn(req.body);
    let token;
    if(userLogged){
        token = tokenUtility.generateAccessToken({ email : req.body.email });
        resp.json({ "message" : "Logged successful", "token" : token });
    }
    else
        resp.json(userLogged);
}

const RegisterUser = async (req, resp) => {
    resp.json(await database.RegisterUser(req.body));
}

module.exports = {
    ValidateUser,
    RegisterUser
}