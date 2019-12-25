<template>
  <div class="login">
    <LoginTrack :mode.sync="mode" />
    <LoginForm :mode.sync="mode" />
  </div>
</template>

<script>
import LoginForm from '../components/Login/LoginForm'
import LoginTrack from '../components/Login/LoginTrack'
import { ref } from '@vue/composition-api'
export default {
  name: 'Login',
  components: {
    LoginForm,
    LoginTrack
  },
  setup () {
    const mode = ref(0)
    return {
      mode
    }
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
