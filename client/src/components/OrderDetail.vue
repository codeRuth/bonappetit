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
              <b-table :data="isEmpty ? [] : tableData">
                <template slot-scope="props">
              <b-table-column label="Item Name" >
                {{ props.row.item_name }}
              </b-table-column>

              <b-table-column label="Quantity" centered>
                {{ props.row.quantity }}
              </b-table-column>

              <b-table-column label="">x</b-table-column>

              <b-table-column label="Price" centered>
                {{ props.row.price }}
              </b-table-column>

              <b-table-column label="Total Price" centered>
                {{ props.row.total_price }}
              </b-table-column>
            </template>
              </b-table>
            </div>
            <div class="row" style="float: right; padding-top: 1%; text-align: right; margin-right: 10%">
              <h6 class="title is-6" style="margin-bottom: 5px">Order Total :  &nbsp;{{ paymentData[0]["@orderTotal"] }} </h6>
              <p>GST (5%) : &nbsp;{{ paymentData[0]["@gst"] }} </p>
              <p style="margin-bottom: 5px">Delivery Charges : &nbsp;30 </p>
              <h4 class="title is-4">Amount Payable : &nbsp;{{ paymentData[0]["@payableAmount"] }}</h4>
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
  import OrderService from '@/services/OrderService'
  import Header from '@/components/Header.vue'
  export default {
    components: {
      'nav-bar': Header
    },
    data () {
      return {
        paymentData: null,
        totalPayment: null,
        tableData: null,
        radio: 'cod'
      }
    },
    created () {
      this.order()
    },
    methods: {
      async order () {
        try {
          let res = await OrderService.order({ cartID: this.$route.params.cartID })
          console.log(res.data)
          this.tableData = res.data['3'] || res.data[3]
          this.paymentData = res.data['5'] || res.data[5]
          this.totalPayment = res.data['5'][0]['@orderTotal'] || res.data[5][0]['@orderTotal']
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      async payment () {
        try {
          let res = await OrderService.payment({
            'rest_id': this.$store.state.rest,
            'cust_id': this.$store.state.user.user_id,
            'cart_id': this.$route.params.cartID,
            'total_amt': this.totalPayment,
            'paid': 1
          })
          console.log(res)
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
            this.payment()
            this.$router.push({ name: 'AccountInfo' })
            this.$toast.open('Order Placed')
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
            this.payment()
            this.$router.push({ name: 'AccountInfo' })
            this.$toast.open('Order Placed')
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
