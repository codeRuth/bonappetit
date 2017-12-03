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
      <h3 class="title is-3">Welcome, {{ ordInf[0][0].name }}</h3>
      <h5 class="subtitle is-5">Find your Info, Orders, their Status and Other details here</h5>
      <div class="columns">
        <div class="column is-one-quarter">
          <div class="card">
            <div class="card-image">
              <figure class="image is-16by9">
                <img v-bind:src="ordInf[0][0].image" alt="Image Not Available">
              </figure>
            </div>
            <div class="card-content">
              <div class="content">
                <p class="title is-4">{{ ordInf[0][0].name }}</p>
                <p class="subtitle is-6">{{ ordInf[0][0].cuisine }}</p>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">{{ ordInf[0][0].address }}</p>
              <p class="card-footer-item">
                <span class="icon icon is-small has-text-warning"><i class="mdi mdi-star"></i></span>{{ ordInf[0][0].rating }}
              </p>
            </footer>
          </div>
        </div>
        <div class="column">
          <h3 class="title is-3">Orders</h3>
          <table class="table is-fullwidth">
            <thead>
            <tr>
              <th class="table-content">ID</th>
              <th class="table-content">Customer Name</th>
              <th class="table-content">Customer Phone</th>
              <th class="table-content">Amount Due / Paid</th>
              <th class="table-content">Delivery Info.</th>
              <th class="table-content">Paid</th>
              <th class="table-content">Accepted</th>
              <th class="table-content">Cooked</th>
              <th class="table-content">Delivered</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in ordInf[1]">
              <th class="table-content">{{ item.order_id }}</th>
              <td class="table-content">{{ item.name }}</td>
              <td class="table-content">{{ item.phone }}</td>
              <td class="table-content">{{ item.total_amt }}</td>
              <td class="table-content">{{ item.del_id }}</td>
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
                <span v-else><a class="button is-success" v-on:click="accepted(item.order_id)">Accept</a></span>
              </td>
              <td class="table-content">
                <span v-if="item.cooked">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
                <span v-else><a class="button is-success" v-on:click="cooked(item.order_id)">Cooked</a></span>
              </td>
              <td class="table-content">
                <span v-if="item.delivered">
                  <b-icon
                    icon="check"
                    size="is-medium"
                    type="is-success">
                </b-icon>
                </span>
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
  export default {
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
          let res = await OrderDetailService.detailRestaurateur(this.$route.params.rid)
          this.ordInf = res.data
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      async accepted (userID) {
        try {
          await OrderDetailService.markAccepted({
            user_id: userID
          })
          this.orderDetail()
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      async cooked (userID) {
        try {
          await OrderDetailService.markCooked({
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
