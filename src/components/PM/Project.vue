<template>
  <div class="project">
    <div
      class="header"
      :style="{backgroundColor:project.color}"
    />
    <p>{{ project.title }}</p>
  </div>
</template>

<script>
import {} from '@vue/composition-api'
export default {
  name: 'Project',
  props: {
    project: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    return {

    }
  }
}
</script>

<style lang='scss'>
.project {
  display: inline-block;
  width: 300px;
  height: 150px;
  background-color: rgba($white, .8);
  border-radius: 20px;
  box-shadow: 1px 1px 3px $shadow;
  margin: 0 10px 5px 10px;
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
    word-break: break-word;
  }
}
</style>
