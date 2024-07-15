<template>
  <nav class="nav has-shadow">
    <div class="container">
      <div class="navbar-brand ">
        <a class="navbar-item" style="font-weight: bold; font-size: 22px;" href="/">bonAppetite</a>
      </div>
      <div class="nav-right nav-menu">
        <span class="navbar-item" v-if="loggedIn">
          <div class="field has-addons">
            <p class="control"><a class="button is-primary" @click="$router.push({ name: 'AccountInfo' })">My Account</a></p>
            <p class="control"><a class="button" @click="logout()">Logout</a></p>
          </div>
        </span>
        <span class="navbar-item" v-else>
            <div class="field has-addons">
              <p class="control"><a class="button is-primary" @click="isLoginModalActive = true">Login</a></p>
              <p class="control"><a class="button" @click="isRegisterModalActive = true">Register</a></p>
            </div>
        </span>
      </div>
    </div>
    <b-modal :active.sync="isLoginModalActive" has-modal-card>
      <login-modal v-bind="formProps"></login-modal>
    </b-modal>

    <b-modal :active.sync="isRegisterModalActive" has-modal-card>
      <register-modal v-bind="formProps"></register-modal>
    </b-modal>
  </nav>
</template>

<script>
  import LoginModal from '@/components/LoginModal.vue'
  import RegisterModal from '@/components/RegisterModal.vue'
  export default {
    components: {
      'login-modal': LoginModal,
      'register-modal': RegisterModal
    },
    computed: {
      loggedIn () {
        return this.$store.state.isUserLoggedIn
      }
    },
    data () {
      return {
        isLoginModalActive: false,
        isRegisterModalActive: false,
        formProps: null
      }
    },
    methods: {
      logout () {
        this.$store.dispatch('setToken', null)
        this.$store.dispatch('setUser', null)
        this.$router.push({ name: 'Home' })
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
