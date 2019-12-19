<template>
  <div class="createProject">
    <label>
      <p>專案名稱 <span>Project</span></p>
      <input
        v-model="name"
        type="text"
      >
    </label>
    <div>
      <p>專案專屬色 <span>Color</span></p>
      <div class="project_color">
        <span
          v-for="color in colors"
          :key="color"
          class="color"
          :style="{backgroundColor: color}"
          :class="{active: selectColor === color}"
          @click="selectColor = color"
        />
      </div>
    </div>
    <button @click="createProject">
      建立專案
    </button>
  </div>
</template>

<script>
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'CreateProject',
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const colors = ref(['#68d2de', '#EB7A77', '#86C166'])
    const name = ref(null)
    const selectColor = ref(null)
    const project = computed(() => {
      return {
        id: props.id + 1,
        info: {
          title: name.value,
          color: selectColor.value
        },
        list: [
          {
            status: '待辦事項',
            todo: []
          },
          {
            status: '進行中',
            todo: []
          },
          {
            status: '已完成',
            todo: []
          }
        ]
      }
    })
    const createProject = () => {
      if (name.value && selectColor.value) {
        emit('createProject', project.value)
        name.value = null
        selectColor.value = null
      }
    }
    return {
      colors,
      name,
      selectColor,
      createProject
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.createProject {
  @include clearfix;
  min-width: 300px;
  background-color: rgba($white, .8);
  border-radius: 20px;
  padding: 15px;
  box-shadow: 1px 1px 3px $shadow;
  @include font(1);
  span {
    @include font;
  }
  label {
    input{
      @include inputReset;
      border: 1px solid $dark;
      border-radius: 10px;
      width: 100%;
      margin: 5px 0;
    }
  }
  .project_color {
    margin: 5px 0;
    max-height: 70px;
    overflow: auto;
    .color {
      display: inline-block;
      width: 25px;
      height: 25px;
      border-radius: 50%;
      background-color: $danger;
      cursor: pointer;
      position: relative;
      margin: 2.5px 2.5px;
      &.active{
        &::before{
          content: '';
          width: 85%;
          height: 85%;
          @include positionCenter;
          background-image: url('../../assets/icon/checked_w.svg');
        }
      }
    }
  }
  >button {
    @include btnReset;
    @include font(1);
    background-color: $primary;
    color: $white;
    padding: 5px;
    border-radius: 5px;
    float: right;
  }
}
</style>
