<template>
  <div class="column">
    <div class="card" v-for="item in items">
    <div class="card-content">
      <p class="title">
        {{item.title}}
      </p>
      <p class="subtitle">
        {{item.cuisine}}
        {{item.rating}}
      </p>
    </div>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        items: [
          { title: 'Polar Bear', cuisine: 'Ice Cream', rating: '4.2' },
          { title: 'Rajadhani', cuisine: 'North Indian', rating: '4.1' },
          { title: 'Meghana Biriyani', cuisine: 'Andhra', rating: '3.2' }
        ]
      }
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
