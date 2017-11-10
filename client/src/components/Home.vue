<template>
  <div class="hello">
    <nav class="nav has-shadow">
      <div class="container">
        <div class="nav-left">
          <a class="nav-item">
            <img src="http://bulma.io/images/bulma-logo.png" alt="Bulma logo">
          </a>
        </div>
        <div class="nav-right nav-menu">
          <a class="nav-item is-tab"><span class="icon"><i class="fa fa-github"></i></span></a>
          <!--<a class="nav-item is-tab is-active" href="index.html">Home</a>-->
          <!--<a class="nav-item is-tab" href="post.html">Static Post</a>-->
          <span class="navbar-item">

            <div class="field has-addons">
              <p class="control">
                <a class="button is-primary" @click="isLoginModalActive = true">Login</a>
              </p>
              <p class="control">
                <a class="button" @click="isRegisterModalActive = true">Register</a>
              </p>
            </div>
            <!--<div class="buttons has-addons">-->
                <!--<span class="button" @click="isLoginModalActive = true">Login</span>-->
                <!--<span class="button" @click="isLoginModalActive = true">Register</span>-->
            <!--</div>-->
          </span>

          <b-modal :active.sync="isLoginModalActive" has-modal-card>
            <login-modal v-bind="formProps"></login-modal>
          </b-modal>

          <b-modal :active.sync="isRegisterModalActive" has-modal-card>
            <register-modal v-bind="formProps"></register-modal>
          </b-modal>

        </div>
      </div>
    </nav>

    <div class="header-content">
      <section class="hero is-light">
        <div class="hero-body">
          <div class="container has-text-centered">
            <h1 class="title is-1 is-spaced">Order from Restaurants near You.</h1>
            <h5 class="subtitle is-5">Start ordering by selecting your Location.</h5>
          </div>
        </div>

        <b-field class="fie">
          <b-input
            placeholder="Type a Delivery Location."
            type="search"
            size="is-medium"
            icon="search">
          </b-input>
          <p class="control">
            <button class="button is-primary is-medium"><span style="font-size: 15px">Search</span></button>
          </p>
        </b-field>

      </section>
    </div>
<section class="container features">
  <div class="columns">
    <div class="column">
      <div class="card">
        <div class="card-content">
          <p class="title">
            “There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.”
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
            “There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.”
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
            “There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.”
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
  import LoginModal from '@/components/LoginModal'
  import RegisterModal from '@/components/RegisterModal'

  export default {
    components: {
      'login-modal': LoginModal,
      'register-modal': RegisterModal
    },
    data () {
      return {
        isLoginModalActive: false,
        isRegisterModalActive: false
      }
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

  .fie {
    justify-content: center;
    align-items: center;
    padding-bottom: 20px;
  }

</style>
