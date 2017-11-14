const auth = require('./controller/auth-controller')
const restaurant = require('./controller/restaurant-controller')
// const authPolicy = require('./policies/auth-controller-policy')

module.exports = (app) => {
  app.post('/register', auth.register)
  app.post('/login', auth.login)
  app.post('/search', restaurant.search)
  // app.get('/restaurants', restaurant.list)
  app.get('/restaurant/:id', restaurant.detail)
}
