<template>
  <div class="cardContent">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      {{ list.status }}
    </div>
    <draggable
      v-model="todoList"
      class="card_body"
      v-bind="dragOptions"
      draggable=".draggable"
      @end="closeDrag"
      @change="changeHandler({step, $event})"
    >
      <TodoCard
        v-for="(todo, index) in list.todo"
        :key="todo.id"
        :color="color"
        :todo="todo"
        @click.native="editCard({step, index})"
        @touchstart.native="editCard({step, index})"
      />
    </draggable>
  </div>
</template>

<script>
import TodoCard from './module/TodoCard'
import draggable from 'vuedraggable'
import { mapState, mapGetters, mapActions, mapMutations } from 'vuex'
import { ref } from '@vue/composition-api'
import bus from '@/bus'
export default {
  name: 'CardContent',
  components: {
    TodoCard,
    draggable
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
  setup (props, { emit }) {
    const dragOptions = ref({
      animation: 300,
      group: 'todo',
      disabled: false,
      ghostClass: 'ghost',
      scroll: true
    })
    const closeDrag = () => emit('closeDrag')
    return {
      dragOptions,
      closeDrag
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapGetters('pmStore', ['projectIndex']),
    todoList: {
      get () {
        return this.list.todo
      },
      set (val) {
        this.moveList({ projectIndex: this.projectIndex, step: this.step, val })
      }
    }
  },
  methods: {
    ...mapActions('pmStore', ['EDIT_TODO_CARD', 'DRAG_LIST']),
    ...mapMutations('pmStore', ['moveList']),
    editCard (info) {
      if (this.isEdit) {
        let res = null
        let promise = new Promise(resolve => { res = resolve })
        bus.$emit('editDone', res)
        promise.then(() => this.EDIT_TODO_CARD(info))
      } else {
        this.EDIT_TODO_CARD(info)
      }
    },
    changeHandler ({ step, $event: { added, removed } }) {
      this.DRAG_LIST({ step, added, removed })
    }
  }
}
</script>

<style lang='scss'>
.cardContent {
  min-width: 320px;
  height: 100%;
  border-radius: 20px;
  background-color: rgba($white, .65);
  margin-right: 10px;
  box-shadow: 1px 1px 3px $shadow;
  .card_head {
    @include cardHead;
  }
  .card_body {
    height: calc(100% - 50px);
    overflow-y: auto;
  }
  .ghost {
    opacity: 0.25;
  }
}
</style>
