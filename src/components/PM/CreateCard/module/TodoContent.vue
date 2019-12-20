<template>
  <div class="todoContent">
    <div class="title">
      <p>{{ content.title }}</p>
      <div @click="deleteTodoContent">
        <img
          src="@/assets/icon/delete.svg"
          alt="delete"
        >
        <img
          src="@/assets/icon/delete_on.svg"
          alt="delete"
        >
      </div>
    </div>
    <div
      v-if="content.lists.length"
      class="progerss"
    >
      <p>{{ progerss }}%</p>
      <div class="bar">
        <span :style="{backgroundColor: color, width: `${progerss}%`}" />
      </div>
    </div>
    <ul class="content">
      <ContentList
        v-for="list in content.lists"
        :key="list.id"
        :list="list"
        @changeStatus="changeStatus"
      />
    </ul>
    <label>
      <input
        v-model="inputValue"
        type="text"
        placeholder="增加項目"
        :style="{backgroundColor: color}"
        @keydown.enter="enterContentList"
      >
      <img
        src="@/assets/icon/plus_w.svg"
        alt="plus"
        width="15"
      >
    </label>
  </div>
</template>

<script>
import ContentList from './ContentList'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'TodoContent',
  components: {
    ContentList
  },
  inject: ['color'],
  props: {
    content: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const inputValue = ref(null)
    const enterContentList = () => {
      if (inputValue.value) {
        emit('enterContentList', {
          id: props.content.id,
          list: {
            id: props.content.lists.length,
            status: false,
            content: inputValue.value
          }
        })
        inputValue.value = null
      }
    }
    const changeStatus = (status) => emit('changeStatus', {
      id: props.content.id,
      status
    })
    const deleteTodoContent = () => emit('deleteTodoContent', props.content.id)
    const progerss = computed(() => {
      let done = props.content.lists.filter(list => {
        return list.status
      }).length
      return (done / props.content.lists.length * 100) >> 0
    })
    return {
      inputValue,
      enterContentList,
      changeStatus,
      deleteTodoContent,
      progerss
    }
  }
}
</script>

<style lang='scss'>
.todoContent {
  padding: 5px 0;
  .title {
    @include font(1);
    position: relative;
    >div {
      @include positionCenter(y);
      @include hoverImg(20px);
      right: 0;
    }
  }
  .progerss {
    margin: 5px 0;
    display: flex;
    align-items: center;
    .bar {
      width: 100%;
      height: 5px;
      border-radius: 5px;
      border: 1px solid $shadow;
      margin-left: 5px;
      position: relative;
      >span {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        border-radius: 5px;
        transition: width .3s;
      }
    }
  }
  .content {
    list-style: none;
  }
  >label{
    position: relative;
    input {
      width: 50%;
      @include btnReset;
      @include font;
      color: $white;
      border-radius: 5px;
      padding: 5px 25px 5px 5px;
      margin: 5px 0;
      transition: all .3s;
      &::-webkit-input-placeholder{
        color: $white;
        text-align: center;
      }
    }
    img {
      @include positionCenter(y);
      right: 5px;
      cursor: pointer;
    }
  }
}
</style>
