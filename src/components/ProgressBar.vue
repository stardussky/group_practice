<template>
  <ul class="progressBar">
    <li
      v-for="page in list"
      :key="page.id"
      @click="changePage(page.id)"
    >
      <p :class="{active: page.id === pathName}">
        {{ page.name.split('|')[0] }}<br>{{ page.name.split('|')[1] }}
      </p>
    </li>
    <span
      class="liner"
      :style="progressBar"
    />
  </ul>
</template>

<script>
import { ref, computed, onMounted, onUnmounted } from '@vue/composition-api'
export default {
  name: 'ProgressBar',
  props: {
    pathName: {
      type: String,
      required: true
    }
  },
  setup (props, { root }) {
    const list = ref([
      {
        id: 'Home',
        name: '首頁|Home'
      },
      {
        id: 'ProjectManagement',
        name: '專案管理|PM'
      },
      {
        id: 'Clock',
        name: '番茄鐘|Clock'
      },
      {
        id: 'Shop',
        name: '商城|Shop'
      },
      {
        id: 'Login',
        name: '會員中心|Member'
      }
    ])
    const width = ref(innerWidth)
    const viewIndex = computed(() => {
      return list.value.map(page => {
        return page.id
      }).indexOf(props.pathName)
    })
    const progressBar = computed(() => {
      let progress = (viewIndex.value + 1) * 100 / list.value.length
      return width.value < 1024 ? { height: `${progress}%` }
        : { width: `${progress}%` }
    })
    const changePage = (page) => {
      root.$router.push({ name: page })
    }
    const resizeHandler = () => {
      width.value = innerWidth
    }
    onMounted(() => {
      window.addEventListener('resize', resizeHandler)
    })
    onUnmounted(() => {
      window.removeEventListener('resize', resizeHandler)
    })
    return {
      list,
      changePage,
      progressBar
    }
  }

}
</script>

<style lang='scss'>
@import '../style/_var';
.progressBar {
  width: 40%;
  display: flex;
  justify-content: space-between;
  list-style: none;
  position: fixed;
  left: 50%;
  bottom: 30px;
  transform: translateX(-50%);
  padding-bottom: 5px;
  >li {
    min-width: 80px;
    @include font;
    cursor: pointer;
    p{
      color: $white;
      text-align: center;
      transition: color .3s;
      &.active {
        color: $primary;
      }
      &:hover {
        color: $primary;
      }
    }
  }
  .liner{
    height: 1px;
    position: absolute;
    bottom: 0;
    left: 0;
    background-image: linear-gradient(to right, $primary, transparent);
    transition: width .3s;
  }
  @include media(1023px){
    left: 40px;
    bottom: 50%;
    transform: translateY(50%);
    width: auto;
    height: 40vh;
    min-height: 250px;
    flex-direction: column;
    padding-bottom: 0;
    padding-left: 5px;
    >li{
      min-width: auto;
    }
    .liner{
      width: 1px;
      height: 100%;
      top: 0;
      bottom: auto;
      background-image: linear-gradient(to bottom, $primary, transparent);
      transition: height .3s;
    }
  }
  @include media(479px){
    left: 10px;
    bottom: 10px;
    transform: translateY(0);
  }
}
</style>
