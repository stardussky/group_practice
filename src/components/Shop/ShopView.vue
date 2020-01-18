<template>
  <div
    class="shop_view"
    :style="backgroundSrc"
  >
    <div class="item_introduction">
      <h2>New Collection</h2>
      <p>{{ productContent }}</p>
      <a href="./mall.html">
        <button>Shop</button>
      </a>
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
      let src = props.currentlist.src[1].replace('img', '')
      return {
        backgroundImage: `url(${require('@/assets' + src)})`
      }
    })
    const productContent = computed(() => {
      let content = props.currentlist.content.replace(/<li>/g, '').replace(/<\/li>/g, '\n')
      return content
    })
    return {
      backgroundSrc,
      productContent
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
      white-space: pre-line;
      margin-bottom: 20px;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 4;
    }
    a{
      display: inline-block;
      button {
        @include baseBtn;
      }
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
      p {
        -webkit-line-clamp: 3;
      }
    }
  }
  @include media(479px){
    .item_introduction {
      p {
        -webkit-line-clamp: 7;
      }
    }
  }
}
</style>
