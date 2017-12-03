// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Buefy from 'buefy'
import { sync } from 'vuex-router-sync'
import 'buefy/lib/buefy.css'
import store from '@/store/store'

Vue.config.productionTip = false

Vue.use(Buefy)
sync(store, router)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
