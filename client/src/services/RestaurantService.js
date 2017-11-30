import Api from '@/services/Api'

export default {
  // generic search
  search (params) {
    return Api().post('/search', params)
  },
  detail (params) {
    return Api().get('/restaurant/' + params)
  }
}
