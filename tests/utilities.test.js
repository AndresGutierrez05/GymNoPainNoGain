const utilities = require('../utilities/token');

describe('Test in utilities file', () => {
    test('should to generate token in generateToken method', () => {
        let token = utilities.generateToken();
        expect( token != null).toBe(true);
    })
    
    test('should to assign token in env variable in generateAccessToken method', () => {
        utilities.generateAccessToken({ email : "abc@hotmail.com" });
        expect( process.env.TOKEN_SECRET != null).toBe(true);
    })
})

