<template>
  <ul
    class="progressBar"
    :class="progressBar.class"
  >
    <li
      v-for="page in list"
      :key="page.id"
      @click="enterPage(page.id)"
    >
      <p :class="{active: page.id === pathName}">
        {{ page.name.split('|')[0] }}<br>{{ page.name.split('|')[1] }}
      </p>
    </li>
    <span
      class="liner"
      :style="progressBar.style"
    />
  </ul>
</template>

<script>
import { ref, computed, onMounted, onUnmounted } from '@vue/composition-api'
import enterRouter from '@/mixins/enterRouter'
export default {
  name: 'ProgressBar',
  mixins: [enterRouter],
  props: {
    pathName: {
      type: String,
      required: true
    },
    projectId: {
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
      return width.value < 1024 && width.value > 479
        ? {
          class: 'vertical',
          style: { height: `${progress}%` }
        }
        : {
          class: 'level',
          style: { width: `${progress}%` }
        }
    })
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
      progressBar
    }
  }
}
</script>

<style lang='scss'>
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
    position: absolute;
  }
  &.level {
    .liner {
      left: 0;
      bottom: 0;
      height: 1px;
      background-image: linear-gradient(to right, $primary, transparent);
      transition: width .3s;
    }
  }
  &.vertical {
    flex-direction: column;
    .liner {
      top: 0;
      left: 0;
      background-image: linear-gradient(to bottom, $primary, transparent);
      width: 1px;
      transition: height .3s;
    }
    >li{
      min-width: auto;
    }
  }
  @include media(1023px){
    width: auto;
    height: 40vh;
    min-height: 250px;
    left: 10px;
    bottom: 50%;
    transform: translateY(50%);
    padding-bottom: 0;
    padding-left: 5px;
    >li{
      @include font(-.875);
    }
  }
  @include media(479px){
    width: calc(100% - 20px);
    min-width: 300px;
    height: auto;
    min-height: auto;
    bottom: 50px;
    transform: translateY(0);
    padding-left: 0;
    >li {
      min-width: auto;
    }
  }
}
</style>
