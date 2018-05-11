<template>
  <input
    placeholder="グローバルID"
    pattern="[0-9]{10}"
    :value="value"
    @input="$emit('input', $event.target.value)">
</template>

<script>
export default {
  props: [
    'value'
  ]
}
</script>
