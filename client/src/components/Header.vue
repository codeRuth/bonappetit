<template>
  <nav class="nav has-shadow">
    <div class="container">
      <div class="nav-left">
        <a class="nav-item">
          <img src="http://bulma.io/images/bulma-logo.png" alt="Bulma logo">
        </a>
      </div>
      <div class="nav-right nav-menu">
        <a class="nav-item is-tab"><span class="icon"><i class="fa fa-github"></i></span></a>
        <span class="navbar-item">
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
    data () {
      return {
        isLoginModalActive: false,
        isRegisterModalActive: false,
        formProps: null
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
