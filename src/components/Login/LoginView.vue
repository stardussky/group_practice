<template>
  <div class="login_view">
    <LoginUserCard :user-info="userInfo" />
    <LoginUserMessage
      v-if="userMessage && userMessage.length"
      :user-message="userMessage"
    />
  </div>
</template>

<script>
import { mapState } from 'vuex'
import LoginUserCard from './LoginUserCard'
import LoginUserMessage from './LoginUserMessage'
export default {
  name: 'LoginView',
  components: {
    LoginUserCard,
    LoginUserMessage
  },
  computed: {
    ...mapState('memberStore', ['userInfo', 'userMessage'])
  }
}
</script>

<style lang='scss'>
  .login_view{
    @include positionCenter(y);
    width: 100%;
    height: 300px;
    background-image: linear-gradient(-30deg,rgba($primary, 1),rgba($third, 1));
    outline: 1px solid $white;
    outline-offset: 10px;
    display: flex;
    justify-content: center;
    @include media(1023px){
      height: 100%;
      display: block;
      overflow-y: auto;
      outline: none;
      border-radius: 20px;
    }
  }
</style>
