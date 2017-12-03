<template>
  <div>
    <b-field class="search-field">
      <b-input
        placeholder="Type a Delivery Location, Restaurants, Cuisines, and Food."
        type="search"
        size="is-medium"
        icon="search"
        v-model="term">
      </b-input>
      <p class="control">
        <router-link :to="{ path: 'search', query: { q: term }}">
          <button class="button is-primary is-medium" v-on:click="search()">
            <span style="font-size: 15px">Search</span>
          </button>
        </router-link>
      </p>
    </b-field>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        term: ''
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
  .search-field {
    justify-content: center;
    align-items: center;
  }
</style>
