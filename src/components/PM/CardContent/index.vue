<template>
  <div class="cardContent">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      {{ list.status }}
    </div>
    <draggable
      v-model="moveList"
      class="card_body"
      :options="dragOptions"
      group="todo"
      @dragstart.native="changeEditStatus(false)"
    >
      <transition-group
        tag="div"
        name="slider"
      >
        <TodoCard
          v-for="(todo, index) in list.todo"
          :key="todo.id"
          :color="color"
          :todo="todo"
          @click.native="editCard({step, index})"
        />
      </transition-group>
    </draggable>
  </div>
</template>

<script>
import TodoCard from './module/TodoCard'
import draggable from 'vuedraggable'
import { mapState, mapActions, mapMutations } from 'vuex'
import { computed } from '@vue/composition-api'
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
  data () {
    return {
      dragOptions: {
        animation: 300,
        disabled: false,
        ghostClass: 'ghost'
      }
    }
  },
  setup (props, { emit }) {
    const moveList = computed({
      get () {
        return props.list.todo
      },
      set (val) {
        emit('moveList', val)
      }
    })
    return {
      moveList
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit'])
  },
  methods: {
    ...mapActions('pmStore', ['EDIT_TODO_CARD', 'DROP_TODO']),
    ...mapMutations('pmStore', ['changeEditStatus']),
    editCard (info) {
      if (this.isEdit) {
        new Promise(resolve => {
          this.changeEditStatus(false)
          resolve()
        }).then(res => this.EDIT_TODO_CARD(info))
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
    >div {
      min-height: 95%;
    }
  }
  .ghost {
    opacity: 0.5;
  }
}
</style>
