<template>
  <div>
    <nav-bar></nav-bar>
<div class="container">
    <div class="columns is-mobile">
      <div class="column is-one-quarter">
        <div class="card">
          <div class="card-image">
            <figure class="image is-16by9">
              <img v-bind:src="post[0].image" alt="Image Not Available">
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <p class="title is-4">{{post[0].name}}</p>
              <p class="subtitle is-6">{{post[0].cuisine}}</p>
            </div>
          </div>
          <footer class="card-footer">
            <p class="card-footer-item">{{post[0].address}}</p>
            <p class="card-footer-item">
              <span class="icon icon is-small has-text-warning"><i class="mdi mdi-star"></i></span>{{post[0].rating}}
            </p>
          </footer>
        </div>

      </div>
      <div class="column is-one-half">
        <b-field position="is-left">
        <b-select placeholder="Sort By">
          <option value="price" selected>Price</option>
          <option value="vegan">Vegan</option>
        </b-select>
      </b-field>
        <b-table
          :data="post"
          :checked-rows.sync="checkedRows">

          <template slot-scope="props">
            <b-table-column>
              <div v-if="props.row.vegan"><span class="icon has-text-success is-small"><i class="mdi mdi-circle"></i></span></div>
              <div v-else><span class="icon has-text-danger is-small"><i class="mdi mdi-circle"></i></span></div>
            </b-table-column>

            <b-table-column label="Item Name">
              {{ props.row.item_name }}
            </b-table-column>

            <b-table-column label="Quantity">
              <span class="icon is-small del"><i class="mdi mdi-minus"></i></span>
              <p class="quantity">{{props.row.quantity}}</p>
              <span v-on:click="addItem(props.row)" class="icon is-small add"><i class="mdi mdi-plus"></i></span>
            </b-table-column>
            <b-table-column label="Price">
              {{ props.row.price }}
            </b-table-column>
          </template>
        </b-table>
        <!--{{checkedRows}}-->
      </div>

      <div class="column is-one-third">
        <cart :data="checkedRows"></cart>
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
      return {
        loading: false,
        post: null,
        error: null,
        quantity: 0,
        checkedRows: []
      }
    },
    created () {
      this.detail()
    },
    watch: {
      '$route': 'restaurant'
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
      addItem (index) {
        this.checkedRows.push(index)
      }
    }
  }
</script>

<style scoped>
  .container {
    padding-top: 7%;
  }

  .add:hover, .del:hover {
    cursor: pointer;
  }
  .quantity {
    align-content: center;
    display: inline;
    padding-left: 3px;
    padding-right: 3px;
  }
</style>
