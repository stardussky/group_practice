<template>
  <div class="login">
    <transition name="fade">
      <div
        v-if="!isLogin"
        key="unlogin"
      >
        <LoginTrack :mode.sync="mode" />
        <LoginForm :mode.sync="mode" />
      </div>
      <LoginView
        v-else
        key="login"
      />
    </transition>
  </div>
</template>

<script>
import LoginForm from '../components/Login/LoginForm'
import LoginTrack from '../components/Login/LoginTrack'
import LoginView from '@/components/Login/LoginView'
import { ref } from '@vue/composition-api'
import { mapState } from 'vuex'
export default {
  name: 'Login',
  components: {
    LoginForm,
    LoginTrack,
    LoginView
  },
  setup () {
    const mode = ref(0)
    return {
      mode
    }
  },
  computed: {
    ...mapState(['isLogin'])
  }
}
</script>

<style lang="scss">
.login {
  height: 100%;
  width: 100%;
  position: relative;
}
</style>
