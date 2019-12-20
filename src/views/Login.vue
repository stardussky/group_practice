<template>
  <div class="login">
    <LoginInfo />
    <LoginForm />
  </div>
</template>

<script>
import LoginForm from '../components/Login/LoginForm'
import LoginInfo from '../components/Login/LoginInfo'
export default {
  name: 'Login',
  components: {
    LoginForm,
    LoginInfo
  }
}
</script>

<style lang="scss">
.login {
  height: 100%;
  width: 100%;
  display: flex;
}
</style>
