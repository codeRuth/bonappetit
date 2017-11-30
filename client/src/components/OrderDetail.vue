<template>
  <div>
    <nav-bar></nav-bar>
    <div class="container">
      <h3 class="title is-3">Order Detail</h3>
      <h5 class="subtitle is-5">Pay by Cash On Delivery or Card Payment, Please note the GST and Delivery Charges.</h5>
      <div class="columns">
        <div class="column is-two-thirds">
          <div class="rows">
            <div class="row">
              <b-table
            :data="isEmpty ? [] : tableDataSimple">
            <template slot-scope="props">
              <b-table-column label="Item Name" >
                {{ props.row.first_name }}
              </b-table-column>

              <b-table-column label="Quantity" centered>
                {{ props.row.last_name }}
              </b-table-column>

              <b-table-column label="">x</b-table-column>

              <b-table-column label="Price" centered>
                {{ props.row.date }}
              </b-table-column>


              <b-table-column label="Total Price" centered>
                {{ props.row.gender }}
              </b-table-column>
            </template>
          </b-table>
            </div>
            <div class="row" style="float: right; padding-top: 1%; text-align: right; margin-right: 10%">
              <h6 class="title is-6" style="margin-bottom: 5px">Order Total :  &nbsp;400 </h6>
              <p>GST(5%) : &nbsp;17 </p>
              <p style="margin-bottom: 5px">Delivery Charges : &nbsp;30 </p>
              <h4 class="title is-4">Amount Payable : &nbsp;400 </h4>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="card">
            <header class="card-header">
              <p class="card-header-title">Payment Mode</p>
              <a href="#"  class="card-header-icon" aria-label="more options"><span class="icon"><i class="fa fa-angle-down" aria-hidden="true"></i></span></a>
            </header>
            <div class="card-content">
              <section>
                <div class="field">
                  <b-radio v-model="radio" size="is-medium" native-value="cod">
                    Cash On Delivery
                  </b-radio>
                </div>
                <div class="field">
                  <b-radio v-model="radio" size="is-medium" native-value="card">
                    Credit / Debit Card
                  </b-radio>
                </div>
              </section>
            </div>
            <footer class="card-footer">
              <a v-on:click="radio == 'cod' ? codConfirm() : cardConfirm()" class="card-footer-item is-primary">Place Order</a>
            </footer>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import SearchService from '@/services/RestaurantService'
  import Header from '@/components/Header.vue'
  import Cart from '@/components/Cart.vue'
  export default {
    components: {
      'nav-bar': Header,
      'cart': Cart
    },
    data () {
      const tableDataSimple = [
        { 'first_name': 'Gobi Manchurian', 'last_name': 1, 'date': '100', 'gender': '100' },
        { 'first_name': 'Pasta De Italia', 'last_name': 4, 'date': '270', 'gender': '870' },
        { 'first_name': 'Pepperoni Pizza', 'last_name': 2, 'date': '45', 'gender': '90' },
        { 'first_name': 'Mosaranna', 'last_name': 1, 'date': '80', 'gender': '80' },
        { 'first_name': 'Bow Bow Biriyani', 'last_name': 2, 'date': '12', 'gender': '24' }
      ]
      return {
        tableDataSimple,
        radio: 'cod'
      }
    },
    methods: {
      async detail () {
        try {
          let res = await SearchService.detail(this.$route.params.id)
          this.post = res.data
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      cardConfirm () {
        this.$dialog.confirm({
          title: 'Pay By Card',
          message: 'Are you sure you want to place the Order?, You can\'t change this.',
          cancelText: 'Cancel',
          confirmText: 'Order',
          type: 'is-success',
          onConfirm: () => {
            this.$router.push({ name: 'OrderDetail' })
            // this.$toast.open('User agreed')
          }
        })
      },
      codConfirm () {
        this.$dialog.confirm({
          title: 'Cash On Delivery',
          message: 'Are you sure you want to place the Order?, You can\'t change this.',
          cancelText: 'Cancel',
          confirmText: 'Order',
          type: 'is-success',
          onConfirm: () => {
            this.$router.push({ name: 'OrderDetail' })
            // this.$toast.open('User agreed')
          }
        })
      }
    }
  }
</script>

<style scoped>
  .container {
    padding-top: 10%;
  }

</style>
