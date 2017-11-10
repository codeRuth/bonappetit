const auth = require('./controller/auth-controller')
// const authPolicy = require('./policies/auth-controller-policy')

module.exports = (app) => {
  app.post('/register', auth.register)
  app.post('/login', auth.login)
  app.get('/restaurants')
  app.get('/restaurant/:name')
}
