<template>
  <div id="constom-component-test1">
    <global-id-input
      required
      v-model="global_id">
    </global-id-input>
    <br/>
    <span>{{ global_id }}</span>
    <br/>
    <span>{{ name }}</span>
    <br/>
    <span>{{ type }}</span>
  </div>
</template>

<script>
import GlobalIdInput from './GlobalIdInput'

export default {
  components: {
    GlobalIdInput
  },
  data () {
    return {
      global_id: '9999999999'
    }
  },
  computed: {
    name () {
      return this.global_id ? 'ソニー　太郎' : '無効なグローバルIDです。'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
