<template>
  <div>
    <nav class="nav has-shadow">
      <div class="container">
        <div class="nav-left">
          <a class="nav-item">
            <img src="http://bulma.io/images/bulma-logo.png" alt="Bulma logo">
          </a>
        </div>
      </div>
    </nav>
    <div class="header-content" style="padding-top: 40px">
      <section class="hero is-light">
        <div class="hero-body">
          <div class="container has-text-centered">
            <h1 class="title is-1" style="padding-bottom: 10px">Welcome Deliverer</h1>
            <h5 class="subtitle is-5">Enter your Deliverer ID to start Delivering to Customers, you can view, change or check status of your Customer's Order</h5>
          </div>
          <b-field style="padding-top: 2%; justify-content: center; align-items: center;">
            <b-input placeholder="Enter your ID" size="is-large" type="number" v-model="term"></b-input>
            <p class="control">
              <router-link :to="{ name: 'DelivererOrderList', params: { did: term }}">
                <button class="button is-primary is-large">
                  <span style="font-size: medium">Submit</span>
                </button>
              </router-link>
            </p>
          </b-field>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        term: ''
      }
    }
  }
</script>

<style scoped>
  .nav {
    position: fixed !important;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1;
  }
</style>
