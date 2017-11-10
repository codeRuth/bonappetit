<template>
  <form action="">
    <div class="modal-card">

      <header class="modal-card-head">
        <p class="modal-card-title">Login to your account</p>
      </header>

      <section class="modal-card-body">

        <b-field>
          <b-input
            type="tel"
            v-model="number"
            placeholder="Phone Number"
            required>
          </b-input>
        </b-field>

        <b-field>
          <b-input
            type="password"
            v-model="password"
            password-reveal
            placeholder="Password"
            required>
          </b-input>
        </b-field>

        <button class="button is-primary is-fullwidth is-medium"  v-on:click="login()">Login</button>
      </section>

      <footer class="modal-card-foot">
        <div>
          <h5 class="title is-5" style="padding-bottom: 10px">Not Registered?</h5>
          <h6 class="subtitle is-6">Join the bonAppetit family Today.</h6>
        </div>
      </footer>

    </div>
  </form>
</template>

<script>
  import AuthenticationService from '@/services/AuthenticationService'
  export default {
    data () {
      return {
        number: '',
        password: '',
        error: null
      }
    },
    methods: {
      async login () {
        try {
          await AuthenticationService.login({
            number: this.number,
            password: this.password
          }).then(this.$router.push('/login-success'))
        } catch (error) {
          this.error = error.data.error || error.data
        }
      }
    }
  }
</script>

<style scoped>
  .modal-card {
    width: auto;
  }

  .modal-card-foot {
    justify-content: center;
    align-items: center;
  }
</style>
