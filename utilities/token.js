const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]

  if (token == null) return res.sendStatus(401)

  jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
    console.log(err)

    if (err) return res.sendStatus(403)

    req.user = user

    next()
  })
}

const generateAccessToken = (email) => {
    process.env.TOKEN_SECRET = generateToken();
    return jwt.sign(email, process.env.TOKEN_SECRET, { expiresIn: '1800s' });
}

const generateToken = () => {
    return require('crypto').randomBytes(64).toString('hex');
}

module.exports = {
    authenticateToken,
    generateAccessToken,
    generateToken
}