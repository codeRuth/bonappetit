<template>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title">Cart</p>
      <a href="#" slot="trigger" class="card-header-icon" aria-label="more options"><span class="icon"><i class="fa fa-angle-down" aria-hidden="true"></i></span></a>
    </header>
    <div class="card-content" v-if="cartState">
      <h6 class="title is-5" style="text-align: center">Cart Empty</h6>
    </div>
    <div class="card-content" v-else>
      <b-table
        :data=data
        :checked-rows.sync="checkedRows">

        <template slot-scope="props">
          <b-table-column label="Item Name">
            {{ props.row.item_name }}
          </b-table-column>

          <b-table-column label="Quantity" width="20" numeric>
            <b-field label="">
              <b-input min="1" type="number" v-model="props.row.quantity"></b-input>
            </b-field>
            <!--<b-field>-->
            <!--<>-->
            <!--<span v-on:click="quantity &#45;&#45;" class="icon is-small del"><i class="mdi mdi-minus"></i></span>-->
            <!--<div v-model="quantity" class="quantity">{{props.row.quantity}}</div>-->
            <!--<span v-on:click="row.quantity ++" class="icon is-small add"><i class="mdi mdi-plus"></i></span>-->
            <!--</b-field>-->
          </b-table-column>

          <b-table-column label="Price">
            {{ props.row.price }}
          </b-table-column>

        </template>
      </b-table>
    </div>
    <footer class="card-footer">
      <a v-on:click="confirmCustom()" class="card-footer-item is-primary">Checkout</a>
    </footer>
  </div>
</template>

<script>
  import OrderService from '@/services/OrderService'
  export default {
    props: [
      'data'
    ],
    data () {
      return {
        loading: false,
        post: null,
        error: null,
        initTotal: 0
      }
    },
    computed: {
      cartState () {
        return this.$store.state.cart.length === 0
      }
    },
    methods: {
      async checkout () {
        try {
          let res = await OrderService.checkout({ cart: this.data, user_id: this.$store.state.user.user_id })
          await this.$router.push({name: 'OrderDetail', params: {'cartID': res.data.cartID}})
        } catch (error) {
          this.error = error.data.error || error.data
        }
      },
      confirmCustom () {
        if (this.$store.state.user == null) {
          this.$dialog.confirm({
            message: 'Please Login or Register to Order',
            cancelText: 'Cancel',
            confirmText: 'OK',
            type: 'is-success',
            onConfirm: () => {
              this.$router.push({name: 'Home'})
            }
          })
        } else {
          this.$dialog.confirm({
            title: 'Place Order',
            message: 'Are you sure you want to place the Order? You can\'t change this.',
            cancelText: 'Cancel',
            confirmText: 'Order',
            type: 'is-success',
            onConfirm: () => {
              this.checkout()
              // this.$toast.open('User agreed')
            }
          })
        }
      }
    }
  }
</script>

<style scoped>

</style>
