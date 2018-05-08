<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <form>
      <button v-on:click="addTodo()">New</button>
      <button>Delete</button>
      <p>input: <input type="text" v-model="newTodo"></p>
      <p>task: {{ newTodo }}</p>
    </form>
    <div class="task-list">
      <label class="task-list__item"
             v-for="(todo, index) in todos" v-bind:key="index">
        <input type="checkbox"><button>Edit</button>{{ todo.text }}
        </label>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'This is a test Vue project!',
      todos: [
        {text: 'vue-router', done: true },
        {text: 'vuex', done: false },
        {text: 'vue-loader', done: false },
        {text: 'awesome-vue', done: true },
      ],
      newTodo: ""
    }
  },
  methods: {
    addTodo(event) {
      let text = this.newTodo && this.newTodo.trim()
      if (!text) {
        return
      }
      this.todos.push({
        text: text,
        done: false
      })
      this.newTodo = ''
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
@mixin flex-vender() {
  display: flex;
  display: -webkit-flex;
  display: -moz-flex;
  display: -ms-flex;
  display: -o-flex;
}
.task-list {
  @include flex-vender;
  flex-direction: column;
  align-items: center;
  &__item {
    width: 270px;
    text-align: left;
    $element: #{&};
    &--checked {
      @extend #{$element};
      color: #85a6c6;
    }
  }
}
</style>
