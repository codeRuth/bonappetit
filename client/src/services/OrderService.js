import Api from '@/services/Api'

export default {
  // generic search
  checkout (params) {
    return Api().post('/checkout', params)
  },
  order (params) {
    return Api().post('/order', params)
  },
  payment (params) {
    return Api().post('/payment', params)
  }
}
