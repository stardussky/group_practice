<template>
  <div class="buttonComponent">
    <slot name="slotButton" />
  </div>
</template>

<script>
export default {
  name: 'ButtonComponent',
  props: {
    content: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang='scss'>
  .buttonComponent{
    display: inline-block;
    margin-right: 20px;
    button{
      @include baseBtn;
    }
  }
</style>
