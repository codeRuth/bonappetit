<template>
  <div>
    <nav class="navbar has-shadow" role="navigation" aria-label="main navigation">
      <div class="container">
        <div class="navbar-brand ">
          <a class="navbar-item" href="/"><img src="https://bulma.io/images/bulma-logo.png" alt="Bulma: a modern CSS framework based on Flexbox"></a>
        </div>
      </div>
    </nav>
    <div class="container" style="padding-top: 5%">
      <h3 class="title is-3">Welcome, {{ ordInf[0][0].del_name }}</h3>
      <h5 class="subtitle is-5">Find your Info, Orders, their Status and Other details here</h5>
      <div class="columns">
        <div class="column is-one-quarter">
          <div class="card">
            <div class="card-image">
              <figure class="image is-16by3">
                <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
              </figure>
            </div>
            <div class="card-content">
              <div class="content">
                <p class="title is-4" style="margin-bottom: 5px">{{ ordInf[0][0].del_name }}</p>
                <p style="margin-bottom: 2px"><Strong>Phone : </strong>+91 {{ ordInf[0][0].del_phone }}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <h3 class="title is-3">Orders</h3>
          <table class="table is-fullwidth">
            <thead>
            <tr>
              <th class="table-content">ID</th>
              <th class="table-content">Restaurant</th>
              <th class="table-content">Customer Name</th>
              <th class="table-content">Customer Phone</th>
              <th class="table-content">Amount Due / Paid</th>
              <th class="table-content">Paid</th>
              <th class="table-content">Accepted</th>
              <th class="table-content">Cooked</th>
              <th class="table-content">Delivered</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in ordInf[1]">
              <th class="table-content">{{ item.order_id }}</th>
              <td class="table-content">{{ item.rname }}</td>
              <td class="table-content">{{ item.name }}</td>
              <td class="table-content">{{ item.phone }}</td>
              <td class="table-content">{{ item.total_amt }}</td>

              <td class="table-content">
                <span v-if="item.paid">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
              </td>
              <td class="table-content">
                <span v-if="item.accepted">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
              </td>
              <td class="table-content">
                <span v-if="item.cooked">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
              </td>
              <td class="table-content">
                <span v-if="item.delivered">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
                <span v-else><a class="button is-success" v-on:click="delivered(item.order_id)">Delivered</a></span>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import OrderDetailService from '@/services/OrderDetailService'
  import Header from '@/components/Header.vue'
  import Cart from '@/components/Cart.vue'
  export default {
    components: {
      'nav-bar': Header,
      'cart': Cart
    },
    data () {
      return {
        loading: false,
        error: null,
        ordInf: null
      }
    },
    created () {
      this.orderDetail()
    },
    methods: {
      async orderDetail () {
        try {
          let res = await OrderDetailService.detailDeliverer(this.$route.params.did)
          this.ordInf = res.data
          console.log(this.ordInf)
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      async delivered (userID) {
        try {
          await OrderDetailService.markDelivered({
            user_id: userID
          })
          this.orderDetail()
        } catch (error) {
          this.error = error.data.error || error.data
        }
      }
    }
  }
</script>

<style scoped>

  .table-content {
    text-align: center;
  }

  .quantity {
    align-content: center;
    display: inline;
    padding-left: 3px;
    padding-right: 3px;
  }
</style>
