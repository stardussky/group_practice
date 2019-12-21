<template>
  <div class="cardContent">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      {{ list.status }}
    </div>
    <div class="card_body">
      <TodoCard
        v-for="todo in list.todo"
        :key="todo.id"
        :color="color"
        :todo="todo"
      />
    </div>
  </div>
</template>

<script>
import TodoCard from './module/TodoCard'
export default {
  name: 'CardContent',
  components: {
    TodoCard
  },
  props: {
    projectId: {
      type: Number,
      required: true
    },
    list: {
      type: Object,
      required: true
    },
    color: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang='scss'>
.cardContent {
  min-width: 300px;
  height: 100%;
  border-radius: 20px;
  background-color: rgba($white, .65);
  overflow-x: hidden;
  margin-right: 10px;
  .card_head {
    @include cardHead;
  }
  .card_body {
    height: calc(100% - 50px);
    overflow-y: auto;
  }
}
</style>
