<template>
  <div id="app">
    <router-link to='/pension-simulator'>Home</router-link>
    <router-link to='/line-chart-test'>Line Chart Test</router-link>
    <router-link to='/bar-chart-test'>Bar Chart Test</router-link>
    <router-link to='/vue-test1'>Vue Test</router-link>
    <router-link to='/custom-component-test1'>Custom Component</router-link>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
