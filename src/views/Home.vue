<template>
  <div class="home">
    <Three :weather="weather" />
    <transition name="fade">
      <div
        v-show="path !== '/'"
        class="container"
      >
        <div class="header">
          <div @click="previous">
            <img
              src="@/assets/icon/left-curve-arrow.svg"
              alt="back"
            >
            <img
              src="@/assets/icon/left-curve-arrow_on.svg"
              alt="back"
            >
          </div>
          <p>{{ pathInfo.title }}</p>
        </div>
        <div class="body">
          <transition
            name="slider"
            mode="out-in"
          >
            <keep-alive exclude="Login">
              <router-view />
            </keep-alive>
          </transition>
        </div>
      </div>
    </transition>
    <NavbarComponent />
    <router-link
      class="logo"
      to="/"
    >
      <img
        src="@/assets/logo.svg"
        alt="logo"
      >
    </router-link>
    <Setting :weather.sync="weather" />
    <Weather />
    <transition name="fade">
      <ProgressBar
        v-if="path !== '/'"
        :path-name="pathInfo.name"
      />
    </transition>
  </div>
</template>

<script>
import Three from '../components/Three'
import NavbarComponent from '../components/NavbarComponent'
import Setting from '../components/Setting'
import Weather from '../components/Weather'
import ProgressBar from '../components/ProgressBar'
import { ref, watch } from '@vue/composition-api'
export default {
  name: 'Home',
  components: {
    Three,
    NavbarComponent,
    Setting,
    Weather,
    ProgressBar
  },
  setup (props, { root }) {
    const weather = ref('day')
    const path = ref(null)
    const pathInfo = ref(null)
    const previous = () => {
      root.$router.go(-1)
    }
    watch(() => root.$route, (to) => {
      path.value = to.path
      pathInfo.value = to.meta
    })
    return {
      weather,
      path,
      pathInfo,
      previous
    }
  }
}
</script>

<style lang="scss">
  .home {
    ::-webkit-scrollbar {
      width: 5px;
      height: 5px;
    }
    ::-webkit-scrollbar-thumb {
      border-radius: 5px;
      background-color: $white;
    }
    ::-webkit-scrollbar-track {
      margin: 15px;
    }
    .container {
      @include container;
    }
    .logo {
      cursor: pointer;
      position: fixed;
      top: 40px;
      left: 40px;
      width: 150px;
    }
    @include media(1023px){
      .logo {
        top: 20px;
        left: 10px;
      }
    }
    @include media(479px){
      .logo {
        width: 85px;
      }
    }
  }
</style>
