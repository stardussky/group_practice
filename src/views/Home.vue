<template>
  <div class="home">
    <Three :weather="weather" />
    <transition name="slider">
      <keep-alive exclude="Login">
        <component
          :is="view"
          v-if="view !== 'Home'"
          :view="view"
        />
      </keep-alive>
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
        v-if="view !== 'Home'"
        key="progressBar"
        :view="view"
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
import ProjectManagement from '../views/ProjectManagement'
import Login from '../views/Login'
import { ref } from '@vue/composition-api'
export default {
  name: 'Home',
  components: {
    Three,
    NavbarComponent,
    Setting,
    Weather,
    ProgressBar,
    ProjectManagement,
    Login
  },
  setup () {
    const weather = ref('day')
    const view = ref(null)
    return {
      weather,
      view
    }
  },
  watch: {
    $route: {
      immediate: true,
      handler (to) {
        this.view = to.name
      }
    }
  }
}
</script>

<style lang="scss">
@import '@/style/_navbarButton';
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
    .logo {
      cursor: pointer;
      position: fixed;
      top: 40px;
      left: 40px;
      width: 25vw;
      max-width: 150px;
      min-width: 80px;
    }
    @include media(479px){
      .logo {
        top: 20px;
        left: 10px;
      }
    }
  }
  .slider-enter-active, .slider-leave-active,
  .fade-enter-active, .fade-leave-active{
    transition: all 1s;
  }
  .slider-enter, .slider-leave-to,
  .fade-enter, .fade-leave-to{
    opacity: 0;
  }
  .slider-enter{
    left: 150% !important;
  }
  .slider-leave-to{
    left: -100% !important;
  }
</style>
