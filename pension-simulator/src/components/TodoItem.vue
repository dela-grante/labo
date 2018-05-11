<template>
  <li>{{ todo.text }}</li>
</template>

<script>
export default {
  props: [
    'todo'
  ],
  created () {
    console.log(`[TodoItem] Created: ${this.todo.text}`)
  }
}
</script>
