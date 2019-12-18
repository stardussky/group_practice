<template>
  <div
    class="project"
    @click="nextStep"
  >
    <div
      class="header"
      :style="{backgroundColor: project.color}"
    />
    <p>{{ project.name }}</p>
  </div>
</template>

<script>
import {} from '@vue/composition-api'
export default {
  name: 'Project',
  props: {
    step: {
      type: String,
      required: true
    },
    project: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const nextStep = () => {
      emit('update:step', '2')
    }
    return {
      nextStep
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.project {
  display: inline-block;
  width: 300px;
  height: 150px;
  background-color: rgba($white, .8);
  border-radius: 20px;
  box-shadow: 1px 1px 3px $shadow;
  margin: 0 0 10px 20px;
  overflow: hidden;
  cursor: pointer;
  position: relative;
  z-index: 1;
  &:hover {
    .header {
      height: 100%;
      opacity: .5;
    }
  }
  .header {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 20px;
    transition: all .3s;
    z-index: -1;
  }
  >p{
    @include font(2);
    padding: 0 10px;
    margin-top: 20px;
  }
}
</style>
