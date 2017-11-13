<template>
  <div class="hello">
    <nav-bar></nav-bar>
    <div class="header-content" style="padding-top: 40px">
      <section class="hero is-light">
        <div class="hero-body">
          <div class="container has-text-centered">
            <h1 class="title is-1 is-spaced">Order from Restaurants near You.</h1>
            <h5 class="subtitle is-5">Start ordering by searching food by Location, Restaurant or Item itself.</h5>
          </div>
        </div>
        <search-bar class="search-field" style="padding-bottom: 20px;"></search-bar>
      </section>
    </div>
    <section class="container features">
      <div class="columns">
        <div class="column">
          <div class="card">
            <div class="card-content">
              <p class="title">
                “There are two hard things in ”
              </p>
              <p class="subtitle">
                Jeff Atwood
              </p>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="card">
            <div class="card-content">
              <p class="title">
                “There are two hard ths.”
              </p>
              <p class="subtitle">
                Jeff Atwood
              </p>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="card">
            <div class="card-content">
              <p class="title">
                “There are two har errors.”
              </p>
              <p class="subtitle">
                Jeff Atwood
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  import SearchBar from '@/components/SearchBar.vue'
  import Header from '@/components/Header.vue'
  export default {
    components: {
      'search-bar': SearchBar,
      'nav-bar': Header
    }
  }
</script>

<style scoped>
  body, .section {
    background-color: whitesmoke;
  }
  .features {
    padding-top: 20px;
  }
</style>
