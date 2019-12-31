<template>
  <div class="cardContent">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      {{ list.status }}
    </div>
    <transition-group
      class="card_body"
      name="slider"
      tag="div"
    >
      <TodoCard
        v-for="(todo, index) in list.todo"
        :key="todo.id"
        :color="color"
        :todo="todo"
        @click.native="editCard({step, index})"
      />
    </transition-group>
  </div>
</template>

<script>
import TodoCard from './module/TodoCard'
import { mapState, mapActions } from 'vuex'
export default {
  name: 'CardContent',
  components: {
    TodoCard
  },
  props: {
    projectId: {
      type: String,
      required: true
    },
    list: {
      type: Object,
      required: true
    },
    color: {
      type: String,
      required: true
    },
    step: {
      type: Number,
      required: true
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit'])
  },
  methods: {
    ...mapActions('pmStore', ['EDIT_TODO_CARD']),
    editCard (info) {
      if (this.isEdit) {
        if (confirm('編輯尚未儲存,是否取消編輯?')) this.EDIT_TODO_CARD(info)
      } else {
        this.EDIT_TODO_CARD(info)
      }
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
