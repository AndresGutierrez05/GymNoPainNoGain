require("dotenv").config();
const database = require("../dataLogic/dbLogic");

describe('Test logic database in dbLogic file', () => {

    test('should to connected to database', () => {
        expect( database.rest != null ).toBe(true);
    })

    test('should to logged admin user in LogIn method', async () => {
        const userAdminLogged = await database.LogIn({
            "email" : "abc123@hotmail.com",
            "password" : "123"
        });
        expect( userAdminLogged != null ).toBe(true);
    })

    test('should to get users with site 1', async () => {
        
        const getUsersBySite = await database.GetUsersBySite();
        expect( getUsersBySite != null ).toBe(true);
    })
    
})
