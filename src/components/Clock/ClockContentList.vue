<template>
  <div class="clockContentList">
    <div class="title">
      <p>{{ content.name }}</p>
    </div>
    <transition-group
      tag="ul"
      :name="content.type === 'self' ? 'slider' : null"
      class="list"
    >
      <ClockList
        v-for="list in content.list"
        :key="list.info.id"
        :list="list"
        :mode="mode"
        :type="content.type"
        :elapsedtimer="elapsedtimer"
        @click.native="selectTarget(list)"
      />
    </transition-group>
    <div
      v-if="content.type === 'self'"
      class="add_clock_list"
    >
      <input
        v-model.trim="listContent"
        type="text"
        placeholder="增加一項"
        @keydown.enter="addList"
      >
      <div @click="addList">
        <img
          src="@/assets/icon/edit.svg"
          alt="edit"
        >
        <img
          src="@/assets/icon/edit_on.svg"
          alt="edit"
        >
      </div>
    </div>
  </div>
</template>

<script>
import ClockList from './ClockList'
import { mapMutations } from 'vuex'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'ClockContentList',
  components: {
    ClockList
  },
  props: {
    content: {
      type: Object,
      required: true
    },
    mode: {
      type: Number,
      required: true
    },
    elapsedtimer: {
      type: Number,
      required: true
    }
  },
  setup (props) {
    const listContent = ref(null)
    const selfList = computed(() => {
      return {
        type: 'self',
        info: {
          content: listContent.value,
          id: Date.now() + '',
          status: false,
          timer: 0
        }
      }
    })
    return {
      listContent,
      selfList
    }
  },
  methods: {
    ...mapMutations('clockStore', ['selectTarget', 'addSelfList']),
    addList () {
      if (this.listContent) {
        this.addSelfList(this.selfList)
        this.listContent = null
      }
    }
  }
}
</script>

<style lang='scss'>
.clockContentList {
  width: 50%;
  min-width: 250px;
  max-width: 400px;
  height: 100%;
  border-radius: 20px;
  background-color: rgba($white, .65);
  margin: 0 10px 10px 0;
  &.self{
    position: relative;
    overflow: hidden;
    .add_clock_list {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      padding: 5px;
      background-color: rgba($white, .65);
      input{
        width: 100%;
        @include inputReset();
        border: none;
        padding-right: 25px;
        &::placeholder{
          text-align: center;
        }
      }
      div{
        @include positionCenter(y);
        right: 0;
        @include hoverImg(30px);
      }
    }
    .list {
      height: calc(100% - 100px);
    }
  }
  >.title {
    @include cardHead;
    background-color: $white;
    color: $textDark;
    position: relative;
  }
  .list {
    height: calc(100% - 60px);
    list-style: none;
    overflow-y: auto;
  }
  @include media(1280px){
    width: 100%;
    height: calc(50% - 5px);
  }
  @include media(767px){
    height: 100%;
    margin: auto;
  }
  @include media(479px){
    max-width: 320px;
    .list {
      height: calc(100% - 50px);
    }
    &.self {
      .list {
        height: calc(100% - 90px);
      }
    }
  }
}
</style>
