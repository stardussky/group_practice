<template>
  <div class="shop">
    <transition :name="direction > 0 ? 'banner' : 'banner_reverse'">
      <ShopView
        v-if="currentlist"
        :key="currentlist.name"
        :currentlist="currentlist"
      />
    </transition>
    <ShopControl
      v-if="currentlist"
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
import { ref, computed, onMounted } from '@vue/composition-api'
export default {
  name: 'Shop',
  components: {
    ShopView,
    ShopControl
  },
  setup () {
    const bannerList = ref(null)
    const listIndex = ref(0)
    const direction = ref(0)
    const currentIndex = computed(() => bannerList.value ? listIndex.value % bannerList.value.length : 0)
    const currentlist = computed(() => bannerList.value ? bannerList.value[currentIndex.value] : null)
    onMounted(async () => {
      bannerList.value = await fetch('./php/mall/getMallAd.php')
        .then(res => res.json())
        .then(json => {
          if (json.status === 'success') return json.data
        })
        .catch(err => console.log(err))
    })
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
  @include media(479px){
    border-radius: 0;
    height: 100%;
  }
}
</style>
