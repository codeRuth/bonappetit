<template>
  <div class="hello">
    <nav-bar></nav-bar>

    <div class="header-content" style="padding-top: 40px">
      <section class="hero is-light">
        <div class="hero-body">
          <div class="container has-text-centered">
            <h1 class="title is-3" style="padding-bottom: 10px">Order from Restaurants near You.</h1>
            <h5 class="subtitle is-6">Start ordering by searching food by Location, Restaurant or Item itself.</h5>
          </div>
        </div>
        <search-bar class="search-field" style="padding-bottom: 20px;"></search-bar>
      </section>
    </div>

    <section class="container features">
      <div class="columns">
        <div class="column">
          <router-link :to="{ name: 'Home'}">
            <div class="card">
              <div class="card-image" style="display: flex; justify-content: center">
                <figure class="image" style="height: 128px; width: 128px;">
                <img src="../assets/customer.png" alt="Placeholder image">
              </figure>
            </div>
            <div class="card-content">
              <p class="is-size-4" style="font-weight: bold">
                Customers
              </p>
              <p class="is-size-6">
                Customers use the above login button to Order.
              </p>
            </div>
          </div>
          </router-link>
        </div>
        <div class="column">
          <router-link :to="{ name: 'Restaurateur'}">
            <div class="card">
            <div class="card-image" style="display: flex; justify-content: center">
              <figure class="image" style="height: 128px; width: 128px;">
                <img src="../assets/restaurant.png" alt="Placeholder image">
              </figure>
            </div>
            <div class="card-content">
              <p class="is-size-4" style="font-weight: bold">Restaurateurs</p>
              <p class="is-size-6">Restaurateurs can View, Update Order Status.</p>
            </div>
          </div>
          </router-link>
        </div>
        <div class="column">
          <router-link :to="{ name: 'Deliverer'}">
            <div class="card">
              <div class="card-image" style="display: flex; justify-content: center">
                <figure class="image" style="height: 128px; width: 128px;">
                <img src="../assets/delivery-bike.png" alt="Placeholder image">
              </figure>
            </div>
            <div class="card-content">
              <p class="is-size-4" style="font-weight: bold">Deliverer</p>
              <p class="is-size-6">Deliverer's can View, Deliver Orders from here.</p>
            </div>
          </div>
          </router-link>
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
  .card-content {
    text-align: center;
  }
</style>
