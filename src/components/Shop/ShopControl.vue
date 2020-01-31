<template>
  <div class="shop_control">
    <div class="item_img">
      <transition :name="direction > 0 ? 'slider_banner' : 'slider_banner_reverse'">
        <img
          :key="currentlist.name"
          :src="backgroundSrc"
          alt="item"
        >
      </transition>
    </div>
    <div class="control">
      <div class="control_dots">
        <div class="info">
          <svg
            height="50"
            width="60"
          >
            <text
              x="50%"
              y="50%"
            >{{ currentIndex &lt; 10 ? '0' + (currentIndex + 1) : currentIndex }}</text>
          </svg>
          <p>{{ currentlist.name }}</p>
        </div>
        <div class="dots">
          <span
            v-for="(num, numIndex) in bannerList"
            :key="num.name"
            :class="{active: numIndex === currentIndex}"
            @click="index = numIndex"
          />
        </div>
      </div>
      <div class="control_btn">
        <button @click="index++">
          <img
            src="@/assets/icon/next.svg"
            alt="right"
          >
          <img
            src="@/assets/icon/next_on.svg"
            alt="right"
          >
        </button>
        <button @click="index--">
          <img
            src="@/assets/icon/back.svg"
            alt="left"
          >
          <img
            src="@/assets/icon/back_on.svg"
            alt="left"
          >
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed, watch, onMounted, onBeforeUnmount, onActivated } from '@vue/composition-api'
export default {
  name: 'ShopControl',
  props: {
    bannerList: {
      type: Array,
      required: true
    },
    currentIndex: {
      type: Number,
      required: true
    },
    currentlist: {
      type: Object,
      required: true
    },
    listIndex: {
      type: Number,
      required: true
    },
    direction: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const disbaled = ref(false)
    const disableSetTime = ref(null)
    const setTime = ref(null)
    const index = computed({
      get () {
        return props.listIndex
      },
      set (val) {
        if (!disbaled.value) {
          emit('update:direction', props.listIndex - val)
          val = (val + props.bannerList.length) % props.bannerList.length
          emit('update:listIndex', val)
          setTimeHandler()
        }
        disbaled.value = true
      }
    })
    const backgroundSrc = computed(() => {
      // let src = props.currentlist.src[2].replace('img', '')
      // return require('@/assets' + src)
      return props.currentlist.src[2]
    })
    const disableHandler = () => {
      clearTime(disableSetTime.value)
      disableSetTime.value = setTimeout(() => { disbaled.value = false }, 1200)
    }
    const setTimeHandler = () => {
      clearTime(setTime.value)
      setTime.value = setTimeout(() => {
        index.value++
      }, 5000)
    }
    const clearTime = (timer) => clearTimeout(timer)
    watch(disbaled, (val) => { if (val)disableHandler() })
    onMounted(() => setTimeHandler())
    onActivated(() => setTimeHandler())
    onBeforeUnmount(() => clearTime(setTime.value))
    return {
      index,
      backgroundSrc
    }
  }
}
</script>

<style lang='scss'>
.shop_control{
  position: absolute;
  bottom: 0;
  left: 0;
  display: flex;
  .item_img {
    width: 250px;
    height: 150px;
    position: relative;
    overflow: hidden;
    img {
      position: absolute;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
  .control {
    height: 150px;
  }
  .control_dots {
    display: inline-block;
    vertical-align: middle;
    width: 280px;
    height: 100%;
    background-image: linear-gradient(-30deg, rgba($primary, 1), rgba($secondary, .7), rgba($third, 1));
    padding: 50px 20px 10px;
    position: relative;
    .info {
      display: flex;
      align-items: center;
      svg {
        flex-shrink: 0;
        text {
          dominant-baseline:middle;
          text-anchor:middle;
          @include font(12);
          stroke: $textDark;
          fill: transparent;
          transition: all 1s;
        }
      }
      > p{
        word-wrap: break-word;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        @include font;
        margin-left: 20px;
      }
    }
    .dots {
      width: 240px;
      position: absolute;
      bottom: 10px;
      text-align: center;
      span {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background-color: $white;
        &.active {
          background-color: $primary;
        }
        &:not(:nth-last-of-type(1)){
          margin-right: 20px;
        }
        cursor: pointer;
      }
    }
  }
  .control_btn {
    display: inline-block;
    vertical-align: middle;
    height: 100%;
    button {
      display: block;
      @include btnReset;
      @include hoverImg(20px);
      width: 40px;
      height: 50%;
      background-color: $dark;
      position: relative;
      &:nth-of-type(1){
        border-bottom: 1px solid $white;
      }
    }
  }
  @include media(1023px){
    flex-wrap: wrap;
  }
  @include media(479px){
    width: 100%;
    flex-wrap: wrap;
    .item_img {
      width: 80%;
      height: 120px;
    }
    .control {
      width: 100%;
      height: 80px;
      .control_dots {
        width: 80%;
        padding: 20px;
        display: inline-flex;
        align-items: center;
        .dots {
          display: none;
        }
      }
      .control_btn {
        width: 20%;
        button{
          width: 100%;
        }
      }
    }
  }
}
</style>
