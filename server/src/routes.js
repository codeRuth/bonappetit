const auth = require('./controller/auth-controller')
const authPolicy = require('./policies/auth-controller-policy')

module.exports = (app) => {
  app.post('/register',
    authPolicy.register,
    auth.register)
  app.post('/register',
      authPolicy.login,
      auth.login)
}
