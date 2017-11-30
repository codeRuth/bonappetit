import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home.vue'
import RestaurantGrid from '@/components/RestaurantGrid.vue'
import SearchResults from '@/components/SearchResults.vue'
import RestaurantDetail from '@/components/RestaurantDetail.vue'
import OrderDetail from '@/components/OrderDetail.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/restaurants',
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
    }
  ]
})
