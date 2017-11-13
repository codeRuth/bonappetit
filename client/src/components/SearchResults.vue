<template>
  <div class="container">
    <!--<p>{{ $route.query.q }}</p>-->
    <div class="loading" v-if="loading">Loading...</div>
    <div v-if="error" class="error">{{ error }}</div>
    <div class="columns is-multiline is-half-mobile is-one-third-tablet is-one-quarter-desktop">
      <div class="column is-one-quarter" v-for="pos in post">
        <restaurant :item="pos"></restaurant>
      </div>
    </div>
  </div>
</template>

<script>
  import SearchService from '@/services/SearchService'
  import Restaurant from '@/components/Restaurant.vue'
  export default {
    components: {
      'restaurant': Restaurant
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
  .columns {
    flex-wrap: wrap;
    align-items: stretch;
  }
</style>
