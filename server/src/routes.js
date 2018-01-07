const auth = require('./controller/auth-controller')
const restaurant = require('./controller/restaurant-controller')
const order = require('./controller/order-controller')
const orderDetail = require('./controller/order-detail-controller')

// const authPolicy = require('./policies/auth-controller-policy')

module.exports = (app) => {
  app.post('/register', auth.register)
  app.post('/login', auth.login)
  app.post('/search', restaurant.search)
  app.get('/restaurant/:id', restaurant.detail)
  app.get('/restaurants/:location', restaurant.rest)
  app.post('/checkout', order.checkout)
  app.post('/order', order.order)
  app.post('/payment', order.payment)
  app.post('/order-detail', order.orderDetail)
  app.get('/del-detail/:did', orderDetail.delDetail)
  app.get('/rest-detail/:rid', orderDetail.restDetail)
  app.post('/accepted', orderDetail.accepted)
  app.post('/cooked', orderDetail.cooked)
  app.post('/delivered', orderDetail.delivered)
}
