<template>
  <div class="shop">
    <transition :name="direction > 0 ? 'banner' : 'banner_reverse'">
      <ShopView
        :key="currentlist.name"
        :currentlist="currentlist"
      />
    </transition>
    <ShopControl
      :banner-list="bannerList"
      :currentlist="currentlist"
      :current-index="currentIndex"
      :list-index.sync="listIndex"
      :direction.sync="direction"
    />
  </div>
</template>

<script>
import ShopView from '@/components/Shop/ShopView'
import ShopControl from '@/components/Shop/ShopControl'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'Shop',
  components: {
    ShopView,
    ShopControl
  },
  setup () {
    const bannerList = ref([
      {
        name: '公事包',
        src: 'https://images.unsplash.com/photo-1531938716357-224c16b5ace3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80',
        content: ''
      },
      {
        name: '色鉛筆',
        src: 'https://images.unsplash.com/photo-1522111608460-19e7331e00fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        content: ''
      },
      {
        name: '紓壓小物',
        src: 'https://images.unsplash.com/photo-1560743787-f7cd7bb9c5f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        content: ''
      }
    ])
    const listIndex = ref(0)
    const direction = ref(0)
    const currentIndex = computed(() => listIndex.value % bannerList.value.length)
    const currentlist = computed(() => bannerList.value[currentIndex.value])
    return {
      bannerList,
      listIndex,
      currentIndex,
      currentlist,
      direction
    }
  }
}
</script>

<style lang='scss'>
.shop {
  width: 100%;
  height: calc(100% - 10px);
  position: relative;
  overflow: hidden;
  border-radius: 0 0 20px 20px;
  @include media(1023px){
    border-radius: 20px;
  }
}
</style>
