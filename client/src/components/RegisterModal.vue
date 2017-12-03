<template>
  <form action="">
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Register with bonAppetit</p>
      </header>
      <section class="modal-card-body">
        <b-field>
          <b-input
            type="text"
            v-model="name"
            placeholder="Name"
            required>
          </b-input>
        </b-field>
        <b-field>
          <b-input
            type="email"
            v-model="email"
            placeholder="Email"
            required>
          </b-input>
        </b-field>
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
        <b-field>
          <b-input
            type="text"
            v-model="address"
            placeholder="Address"
            required>
          </b-input>
        </b-field>
        <div class="field">
          <b-checkbox v-model="checkbox">
            I Accept all the Terms and Conditions
          </b-checkbox>
        </div>
        <button class="button is-primary is-fullwidth is-medium" v-on:click="register()">Register</button>
      </section>
      <footer class="modal-card-foot">
      <div>
        <h3 class="title is-5" style="padding-bottom: 10px">Already a member ?</h3>
        <h6 class="subtitle is-6">Login now and start tracking.</h6>
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
        name: '',
        email: '',
        password: '',
        address: '',
        error: null
      }
    },
    methods: {
      async register () {
        try {
          await AuthenticationService.register({
            number: this.number,
            name: this.name,
            email: this.email,
            password: this.password,
            address: this.address
          })
          this.$toast.open('Registered Successfully')
          this.$router.push({ name: 'Home' })
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
