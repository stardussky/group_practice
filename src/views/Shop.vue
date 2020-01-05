<template>
  <div class="shop">
    <ShopView />
    <ShopControl />
  </div>
</template>

<script>
import ShopView from '@/components/Shop/ShopView'
import ShopControl from '@/components/Shop/ShopControl'
export default {
  name: 'Shop',
  components: {
    ShopView,
    ShopControl
  }
}
</script>

<style lang='scss'>
.shop {
  width: 100%;
  height: 100%;
  padding-bottom: 10px;
  position: relative;
}
</style>
