<template>
  <div class="home">
    <Three
      :weather="weather"
      :project-id="id || ''"
    />
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
            name="fade"
            mode="out-in"
          >
            <keep-alive include="Clock">
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
    <Weather :weather.sync="weather" />
    <transition name="fade">
      <ProgressBar
        v-if="path !== '/'"
        :path-name="pathInfo.name"
        :project-id="id || ''"
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
import { mapActions, mapState, mapMutations } from 'vuex'
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
      if (pathInfo.value && pathInfo.value.title === '專案內容') {
        root.$router.push({ name: 'ProjectManagement' })
      } else {
        root.$router.push({ path: '/' })
      }
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
  },
  computed: {
    ...mapState('pmStore', ['id']),
    ...mapState(['isLogin'])
  },
  watch: {
    isLogin (val) {
      if (val) {
        window.removeEventListener('beforeunload', this.beforeunloadLeave)
      } else {
        window.addEventListener('beforeunload', this.beforeunloadLeave)
      }
    }
  },
  created () {
    window.addEventListener('beforeunload', this.beforeunloadLeave)
    window.addEventListener('beforeunload', this.beforeunloadRecord)
    this.CHECK_LOGIN()
  },
  destroyed () {
    window.removeEventListener('beforeunload', this.beforeunloadLeave)
    window.removeEventListener('beforeunload', this.beforeunloadRecord)
  },
  methods: {
    ...mapActions('memberStore', ['CHECK_LOGIN']),
    ...mapMutations('clockStore', ['selectTarget']),
    beforeunloadLeave (e) {
      (e || window.event).returnValue = ''
    },
    beforeunloadRecord (e) {
      this.selectTarget(null)
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
      top: 35px;
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
