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
              <span class="icon icon is-small has-text-warning"><i class="fa fa-star"></i></span>{{post[0].rating}}
            </p>
          </footer>
        </div>

      </div>
      <div class="column is-one-half">
        <div class="row" v-for="pos in post">
          <div class="card">
            <div class="card-content">
              <div class="content">{{pos.item_name}} - {{pos.price}}</div>
            </div>
          </div>
        </div>
      </div>
      <div class="column is-one-quarter">
        <p>Hello World</p>
      </div>
    </div>
</div>
  </div>
</template>

<script>
  import SearchService from '@/services/RestaurantService'
  import Header from '@/components/Header.vue'
  export default {
    components: {
      'nav-bar': Header
    },
    data () {
      return {
        loading: false,
        post: null,
        error: null
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
      }
    }
  }
</script>

<style scoped>
  .container {
    padding-top: 7%;
  }
</style>
