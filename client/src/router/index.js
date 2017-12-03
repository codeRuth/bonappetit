import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home.vue'
import RestaurantGrid from '@/components/RestaurantGrid.vue'
import SearchResults from '@/components/SearchResults.vue'
import RestaurantDetail from '@/components/RestaurantDetail.vue'
import OrderDetail from '@/components/OrderDetail.vue'
import AccountInfo from '@/components/AccountInfo.vue'

import Restaurateur from '@/components/restaurateur/Restaurateur.vue'
import RestaurateurOrderList from '@/components/restaurateur/RestaurateurOrderList.vue'
import Deliverer from '@/components/deliverer/Deliverer.vue'
import DelivererOrderList from '@/components/deliverer/DelivererOrderList.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/restaurants/:location',
      name: 'RestaurantGrid',
      component: RestaurantGrid
    },
    {
      path: '/search',
      name: 'SearchResults',
      component: SearchResults
    },
    {
      path: '/restaurant/:id',
      name: 'RestaurantDetail',
      component: RestaurantDetail
    },
    {
      path: '/order',
      name: 'OrderDetail',
      component: OrderDetail
    },
    {
      path: '/account-info',
      name: 'AccountInfo',
      component: AccountInfo
    },
    {
      path: '/restaurateur',
      name: 'Restaurateur',
      component: Restaurateur
    },
    {
      path: '/restaurateur/:rid/orders',
      name: 'RestaurateurOrderList',
      component: RestaurateurOrderList
    },
    {
      path: '/deliverer',
      name: 'Deliverer',
      component: Deliverer
    },
    {
      path: '/deliverer/:did/orders',
      name: 'DelivererOrderList',
      component: DelivererOrderList
    }
  ]
})
