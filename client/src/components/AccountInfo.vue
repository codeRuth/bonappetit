<template>
  <div>
    <nav-bar></nav-bar>
    <div class="container">
      <div v-if="isLoggedIn">
        <h3 class="title is-3">Account Info</h3>
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
                  <p class="title is-4" style="margin-bottom: 5px">{{$store.state.user['name']}}</p>
                  <p style="margin-bottom: 2px"><Strong>Phone : </strong>+91 {{$store.state.user['phone']}}</p>
                  <p><Strong>Email : </strong>{{$store.state.user['email']}}</p>
                </div>
              </div>
              <footer class="card-footer">
                <p class="card-footer-item">{{$store.state.user['address']}}</p>
              </footer>
            </div>
          </div>
          <div class="column">
            <h3 class="title is-3">Orders</h3>
            <table class="table is-fullwidth">
              <thead>
                <tr>
                  <th class="table-content">ID</th>
                  <th class="table-content">Restaurant</th>
                  <th class="table-content">Amount Due / Paid</th>
                  <th class="table-content">Delivery Info.</th>
                  <th class="table-content">Paid</th>
                  <th class="table-content">Accepted</th>
                  <th class="table-content">Cooked</th>
                  <th class="table-content">Delivered</th>
                </tr>
              </thead>
              <tbody>
              <tr v-for="item in ordInf">
                <th class="table-content">{{ item.order_id }}</th>
                <td class="table-content">{{ item.name }}</td>
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
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div style="text-align: center; margin-top: 10%" v-else>
        <h3 class="title is-3">You haven't Logged In, Please Login.</h3>
        <h5 class="subtitle is-5">You can find the Login Button on the right top corner.</h5>
      </div>
    </div>
  </div>
</template>

<script>
  import OrderService from '@/services/OrderService'
  import Header from '@/components/Header.vue'
  import Cart from '@/components/Cart.vue'
  export default {
    components: {
      'nav-bar': Header,
      'cart': Cart
    },
    data () {
      const tableDataSimple = [
        { 'id': 1, 'first_name': 'Jesse', 'last_name': 'Simmons', 'date': '2016-10-15 13:43:27', 'gender': 'Male' },
        { 'id': 2, 'first_name': 'John', 'last_name': 'Jacobs', 'date': '2016-12-15 06:00:53', 'gender': 'Male' },
        { 'id': 3, 'first_name': 'Tina', 'last_name': 'Gilbert', 'date': '2016-04-26 06:26:28', 'gender': 'Female' },
        { 'id': 4, 'first_name': 'Clarence', 'last_name': 'Flores', 'date': '2016-04-10 10:28:46', 'gender': 'Male' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' }
      ]
      return {
        tableDataSimple,
        defaultOpenedDetails: [1],
        loading: false,
        error: null,
        ordInf: null
      }
    },
    created () {
      this.orderDetail()
    },
    computed: {
      isLoggedIn () {
        return this.$store.state.isUserLoggedIn
      }
    },
    methods: {
      async orderDetail () {
        try {
          let res = await OrderService.orderDetail({
            user_id: this.$store.state.user.user_id
          })
          this.ordInf = res.data
        } catch (error) {
          this.error = error.data.error || error.data
        }
      }
    }
  }
</script>

<style scoped>
  .container {
    padding-top: 7%;
  }

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
