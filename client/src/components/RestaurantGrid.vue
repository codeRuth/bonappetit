<template>
  <div class="hello" style="overflow: auto">
    <nav-bar></nav-bar>
    <section class="section">
      <div class="container features">
        <h3 class="title is-3">Restaurants near You</h3>
        <h5 class="subtitle is-5">Here are all the restaurants that are serving in your location</h5>
        <div class="columns is-multiline is-half-mobile is-one-third-tablet is-one-quarter-desktop">
          <div class="column is-one-quarter" v-for="pos in post">
            <restaurant :item="pos"></restaurant>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  import Header from '@/components/Header.vue'
  import RestService from '@/services/RestaurantService'
  import Restaurant from '@/components/Restaurant.vue'
  export default {
    data () {
      return {
        post: null
      }
    },
    created () {
      this.restaurants()
    },
    watch: {
      '$route': 'restaurants'
    },
    methods: {
      async restaurants () {
        try {
          let res = await RestService.restaurants(this.$route.params.location)
          this.post = res.data
        } catch (error) {
          this.error = error.data.error || error.data
        }
      }
    },
    components: {
      'nav-bar': Header,
      'restaurant': Restaurant
    }
  }
</script>

<style scoped>
  body, .section {
    background-color: whitesmoke;
  }
  .features {
    padding-top: 3%;
  }
</style>
