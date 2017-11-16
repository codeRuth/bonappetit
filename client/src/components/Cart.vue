<template>
  <div class="card">
  <header class="card-header">
    <p class="card-header-title">
      Cart
    </p>
    <a href="#" class="card-header-icon" aria-label="more options">
      <span class="icon">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
      </span>
    </a>
  </header>
  <div class="card-content">
    <div class="content">
      <b-table
        :data="data"
        :checked-rows.sync="checkedRows">

        <template slot-scope="props">
          <b-table-column label="Item Name">
            {{ props.row.item_name }}
          </b-table-column>

          <b-table-column label="Quantity">
            <span class="icon is-small del"><i class="mdi mdi-minus"></i></span>
            <div class="quantity">{{props.row.quantity}}</div>
            <span v-on:click="addItem(props.row, ++quantity)" class="icon is-small add"><i class="mdi mdi-plus"></i></span>
          </b-table-column>

          <b-table-column label="Price">
            {{ props.row.price }}
          </b-table-column>

        </template>
      </b-table>
      <!--<table class="table is-narrow">-->
        <!--<thead>-->
        <!--<tr>-->
          <!--<th>Item</th>-->
          <!--<th>Quantity</th>-->
          <!--<th>Price</th>-->
        <!--</tr>-->
        <!--</thead>-->
        <!--<tbody>-->
        <!--<tr>-->
        <!--&lt;!&ndash;<tr v-for="pos in post">&ndash;&gt;-->
          <!--<td>Crispy Honey Chilli Potato</td>-->
          <!--<td>-->
            <!--<span class="icon is-small"><i class="mdi mdi-minus"></i></span>-->
            <!--{{qty}}-->
            <!--<span class="icon is-small"><i class="mdi mdi-plus"></i></span>-->
          <!--</td>-->
          <!--<td>80</td>-->
        <!--</tr>-->
        <!--</tbody>-->
      <!--</table>-->
        <p class="billing" style="margin-bottom: 5px">Item Total : <span class="billing-amt">216.00</span></p>
        <p class="billing" style="margin-bottom: 5px">GST : <span class="billing-amt">10.00</span></p>
        <p class="billing">Delivery Charges : <span class="billing-amt">55.00</span></p>
    </div>
  </div>
  <footer class="card-footer">
    <a v-on:click="" class="card-footer-item is-primary">Checkout</a>
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
        error: null
      }
    },
    methods: {
      async checkout () {
        try {
          let res = await OrderService.checkout({
            cart: this.$route.query.q
          })
          this.post = res.data
        } catch (error) {
          this.error = error.data.error || error.data
        }
      }
    }
  }
</script>

<style scoped>
  .billing {
    margin-bottom: 2px;
    font-weight: bold;
  }
  .billing-amt {
    float: right;
    font-weight: normal;
  }

</style>
