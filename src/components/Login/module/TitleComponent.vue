<template>
  <h2 class="titleComponent">
    {{ content }}
  </h2>
</template>

<script>
export default {
  name: 'TitleComponent',
  props: {
    content: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang='scss'>
  .titleComponent{
    @include font(3);
    color: $dark;
    margin-bottom: 20px;
    text-align: center;
  }
</style>
