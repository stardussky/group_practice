<template>
  <div
    class="shop_view"
    :style="backgroundSrc"
  >
    <div class="item_introduction">
      <h2>New Collection</h2>
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
      <button>Shop</button>
    </div>
  </div>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'ShopView',
  props: {
    currentlist: {
      type: Object,
      required: true
    }
  },
  setup (props) {
    const backgroundSrc = computed(() => {
      return {
        backgroundImage: `url('${props.currentlist.src}')`
      }
    })
    return {
      backgroundSrc
    }
  }
}
</script>

<style lang='scss'>
.shop_view {
  width: 100%;
  height: 100%;
  background-position: center;
  background-size: cover;
  padding-top: 80px;
  overflow: hidden;
  left: 0;
  .item_introduction {
    width: 500px;
    background-color: rgba($white, .7);
    box-shadow: 1px 1px 3px $shadow;
    padding: 30px;
    color: $dark;
    h2 {
      @include font(10);
      margin-bottom: 10px;
      white-space: nowrap;
    }
    p {
      @include font;
      margin-bottom: 20px;
    }
    button {
      @include baseBtn;
    }
  }
  @include media(1023px){
    padding-top: 0;
    .item_introduction {
      width: 100%;
      height: 100%;
      box-shadow: none;
      h2 {
        @include font(5);
      }
    }
  }
}
</style>
