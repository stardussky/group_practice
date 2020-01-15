<template>
  <div class="login_view">
    <div class="title">
      <h2>Welcome back !</h2>
      <p>{{ userInfo.mem_id }}</p>
    </div>
    <div class="headshot">
      <img
        :src="headShot"
        alt="user"
      >
    </div>
    <div class="control">
      <a
        href="#"
        class="control_member"
      >
        <button>
          會員中心
        </button>
      </a>
      <button
        class="control_logout"
        @click="LOGOUT"
      >
        登出
      </button>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'LoginView',
  computed: {
    ...mapState('memberStore', ['userInfo']),
    headShot () {
      return this.userInfo.headshot
        ? `http://localhost/phpLab/dd104g3/img/${this.userInfo.headshot}`
        : `${require('@/assets/icon/user.svg')}`
    }
  },
  methods: {
    ...mapActions('memberStore', ['LOGOUT'])
  }
}
</script>

<style lang='scss'>
  .login_view{
    @include positionCenter;
    width: 500px;
    height: 300px;
    background-image: linear-gradient(-30deg,rgba($primary, 1),rgba($third, 1));
    box-shadow: 1px 1px 3px $shadow;
    padding: 20px;
    border-radius: 20px;
    overflow: hidden;
    .title {
      color: $white;
      text-align: center;
      margin-bottom: 20px;
      h2 {
        @include font(5);
        margin-bottom: 10px;
      }
      p{
        @include font(2);
        font-weight: 600;
      }
    }
    .headshot {
      width: 10vw;
      max-width: 100px;
      min-width: 80px;
      height: 10vw;
      max-height: 100px;
      min-height: 80px;
      background-color: rgba($white, .3);
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: auto;
      >img {
        width: 90%;
        height: 90%;
        object-fit: cover;
        border-radius: 50%;
      }
    }
    .control {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      a {
        display: inline-block;
      }
      button {
        @include btnReset;
        @include font(1);
        color: $textDark;
        height: 50px;
        background-color: rgba($white, .3);
      }
      &_member {
        width: 80%;
        position: relative;
        button {
          width: 100%;
          border-right: 1px solid $white;
        }
        &::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-image: linear-gradient(to right, rgba($white, .5), transparent);
          transform: scaleX(0);
          transform-origin: right;
          transition: transform .3s;
          z-index: -1;
        }
        &:hover{
          &::before{
            transform: scaleX(1);
            transform-origin: left;
          }
        }
      }
      &_logout {
        width: 20%;
        transition: all .3s;
        &:hover{
          background-color: $primary;
          color: $white;
        }
      }
    }
    @include media(767px){
      width: 100%;
    }
    @include media(479px){
      background-image: none;
      background-color: rgba($white, .3);
    }
  }
</style>
