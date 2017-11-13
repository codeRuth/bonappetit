<template>
  <div class="hello">
    <nav-bar></nav-bar>
    <section class="section">
      <div class="container features">
        <div class="columns">
          <div class="column">
            <restaurant  v-for="item in items"></restaurant>
        </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  import Header from '@/components/Header.vue'
  import Restaurant from '@/components/Restaurant.vue'
  export default {
    data () {
      return {
        items: [
          { title: 'Polar Bear', cuisine: 'Ice Cream', rating: '4.2' },
          { title: 'Rajadhani', cuisine: 'North Indian', rating: '4.1' },
          { title: 'Meghana Biriyani', cuisine: 'Andhra', rating: '3.2' }
        ]
      }
    },
    components: {
      'nav-bar': Header,
      'restaurant': Restaurant
    }
  }
</script>

<style scoped>
  body, .section {
    background-color: whitesmoke;
  }
  .features {
    padding-top: 3%;
  }
</style>
