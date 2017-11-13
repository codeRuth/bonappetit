<template>
  <div class="card">
  <div class="card-image">
    <figure class="image is-16by9">
      <img v-bind:src="item.image" alt="Image Not Available">
    </figure>
  </div>
  <div class="card-content">
    <p class="title is-5">
      {{item.name}}
    </p>
    <p class="subtitle is-6" style="padding-top: 3%">
      {{item.cuisine}}
    </p>
  </div>
  <footer class="card-footer">
    <p class="card-footer-item">{{item.address}}</p>
    <p class="card-footer-item">
      <span class="icon icon is-small has-text-warning">
        <i class="fa fa-star"></i>
      </span>
      {{item.rating}}</p>
  </footer>
  </div>
</template>

<script>
  export default {
    props: [
      'item'
    ]
  }
</script>

<style scoped>
  .card {
    display:flex;
    flex-direction: column;
  }
  .cart-footer {
    margin-top: auto;
  }
</style>
