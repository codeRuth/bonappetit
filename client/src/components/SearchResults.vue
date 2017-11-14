<template>
  <div>
  <nav-bar></nav-bar>
  <div class="container">
    <!--<p>{{ $route.query.q }}</p>-->
    <section>
    <h3 class="title is-3">Search Results for '{{$route.query.q}}'</h3>
    <h5 class="subtitle is-5">101 Retaurants found</h5>
    <div class="loading" v-if="loading">Loading...</div>
    <div v-if="error" class="error">{{ error }}</div>
    <div class="columns is-multiline is-half-mobile is-one-third-tablet is-one-quarter-desktop">
      <div class="column is-one-quarter" v-for="pos in post">
        <restaurant :item="pos"></restaurant>
      </div>
    </div>
    </section>
  </div>
  </div>
</template>

<script>
  import SearchService from '@/services/RestaurantService'
  import Restaurant from '@/components/Restaurant.vue'
  import Header from '@/components/Header.vue'
  export default {
    components: {
      'restaurant': Restaurant,
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
      this.search()
    },
    watch: {
      '$route': 'search'
    },
    methods: {
      async search () {
        try {
          let res = await SearchService.search({
            q: this.$route.query.q
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
  .container {
    padding-top: 10%;
  }
  .columns {
    flex-wrap: wrap;
    align-items: stretch;
  }
</style>
