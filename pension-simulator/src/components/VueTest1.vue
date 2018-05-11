<template>
  <div id="vuetest1">
      <button @click="toggleVisibility()">Toggle</button>
      <button @click="addTask()">Add</button>
      <button @click="reverseMessage()">Reverse!</button>
      <br/>
      <span v-if="visible">
        {{ message + postfix }}
      </span>
      <span v-if="visible">
        {{ reversedMessage }}
      </span>
      <span v-if="visible">
        {{ reversedMessageWithPostfix }}
      </span>
      <span v-if="visible">
        {{ reversedReversedMessageWithPostfix }}
      </span>
      <br/>
      <input v-model="message">
      <input v-model="postfix">
      <ol>
        <todo-item v-for="(item, index) in groceryList" :todo="item" :key="index"></todo-item>
      </ol>
      <ol>
        <todo-item></todo-item>
        <todo-item2></todo-item2>
        <li v-for="(todo, index) in todos" :key="index">
          {{ todo.text }}
        </li>
      </ol>
  </div>
</template>

<script>
import TodoItem from './TodoItem'

export default {
  components: {
    TodoItem
  },
  data () {
    return {
      message: 'Hello Vue!',
      postfix: '.txt',
      visible: true,
      todos: [
        { text: 'Learn JavaScript' },
        { text: 'Learn Vue' },
        { text: 'Build something awesome' }
      ],
      groceryList: [
        { id: 0, text: 'Vegetables' },
        { id: 1, text: 'Cheese' },
        { id: 2, text: 'Meat' }
      ]
    }
  },
  computed: {
    reversedMessage () {
      return this.message.split('').reverse().join('')
    },
    reversedMessageWithPostfix () {
      return (this.message + this.postfix).split('').reverse().join('')
    },
    reversedReversedMessageWithPostfix () {
      return this.reversedMessageWithPostfix.split('').reverse().join('')
    }
  },
  watch: {
    postfix () {
      console.log('postfix updated.')
    }
  },
  methods: {
    toggleVisibility () {
      this.visible = !this.visible
    },
    addTask () {
      this.todos.push({text: 'New task at ' + new Date().toLocaleString()})
      this.groceryList.push({ text: 'Something else' })
    },
    reverseMessage () {
      this.message = this.message.split('').reverse().join('')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
