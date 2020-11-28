<template>
  <div id="app">
    <nav-bar></nav-bar>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  components: {
    NavBar: () => import("./parts/components/navbar")
  }
}
</script>

<style>
</style>
