import Api from '@/services/Api'

export default {
  // generic search
  detailDeliverer (params) {
    return Api().get('/del-detail/' + params)
  },
  detailRestaurateur (params) {
    return Api().get('/rest-detail/' + params)
  },
  markDelivered (params) {
    return Api().post('/delivered', params)
  },
  markCooked (params) {
    return Api().post('/cooked', params)
  },
  markAccepted (params) {
    return Api().post('/accepted', params)
  }
}
