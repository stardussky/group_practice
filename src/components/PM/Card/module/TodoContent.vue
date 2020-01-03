<template>
  <div class="todoContent">
    <div class="title">
      <img
        src="@/assets/icon/content.svg"
        alt="content"
        width="20"
      >
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
    <div class="content">
      <ul>
        <ContentList
          v-for="(list, index) in content.lists"
          :key="list.id"
          :list="list"
          @changeStatus="changeStatus($event, index)"
          @deleteTodoList="deleteTodoList(index)"
          @setTodoClock="setTodoClock($event, index)"
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
          @mousedown="enterContentList"
        >
      </label>
    </div>
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
  props: {
    content: {
      type: Object,
      required: true
    },
    color: {
      type: String,
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
            id: Math.random() + '',
            status: false,
            isClock: false,
            content: inputValue.value,
            timer: 0
          }
        })
        inputValue.value = null
      }
    }
    const changeStatus = (status, index) => emit('changeStatus', { status, index })
    const deleteTodoList = (index) => emit('deleteTodoList', index)
    const setTodoClock = (status, index) => emit('setTodoClock', { status, index })

    const deleteTodoContent = () => emit('deleteTodoContent')
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
      deleteTodoList,
      setTodoClock,
      progerss
    }
  }
}
</script>

<style lang='scss'>
.todoContent {
  padding: 5px 0;
  border-bottom: 1px solid $shadow;
  .title {
    @include font(1);
    display: flex;
    align-items: center;
    margin: 5px 0;
    position: relative;
    p{
      margin-left: 10px;
      width: 85%;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    >div {
      position: absolute;
      right: 0;
      @include hoverImg(30px);
    }
  }
  .progerss {
    padding: 5px 0;
    display: flex;
    align-items: center;
    @include font;
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
    padding-left: 30px;
    >label{
      position: relative;
      input {
        width: 30%;
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
        &:focus {
          width: 90%;
        }
      }
      img {
        @include positionCenter(y);
        right: 5px;
        cursor: pointer;
      }
    }
  }
  @include media(479px){
    .content {
      >label{
        input {
          width: 40%;
        }
      }
    }
  }
}
</style>
