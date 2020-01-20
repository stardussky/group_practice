<template>
  <transition-group
    tag="ul"
    class="loginUserMessage"
    name="slider_reverse"
  >
    <li
      v-for="(msg, index) in userMessage"
      :key="msg.inviteProject"
    >
      <div class="message">
        <div class="invite_head">
          <img
            :src="msg.inviteHeadShot ? `./userImg/${msg.inviteHeadShot}` : require('@/assets/icon/user.svg')"
            alt="headShot"
          >
        </div>
        <p>{{ msg.inviteMemberName || msg.inviteMemberId }} 邀請您加入 {{ msg.inviteProject }} 專案</p>
      </div>
      <div class="message_btn">
        <button @click="REPLY_MESSAGE({index, projectId: msg.inviteProjectId, status: false})">
          Refuse
        </button>
        <button @click="REPLY_MESSAGE({index, projectId: msg.inviteProjectId, status: true})">
          Accept
        </button>
      </div>
    </li>
  </transition-group>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'LoginUserMessage',
  props: {
    userMessage: {
      type: Array,
      required: true
    }
  },
  methods: {
    ...mapActions('memberStore', ['REPLY_MESSAGE'])
  }
}
</script>

<style lang='scss'>
.loginUserMessage {
  width: 60%;
  height: 100%;
  list-style: none;
  overflow-y: auto;
  overflow-x: hidden;
  &::-webkit-scrollbar-track {
    margin: 10px;
  }
  li {
    width: 95%;
    min-height: 80px;
    background-color: rgba($white, .4);
    padding: 5px 5px 0 5px;
    color: $textDark;
    border-radius: 10px;
    margin: 10px auto;
    overflow: hidden;
    @include font(1);
    .message {
      display: flex;
      align-items: center;
      padding-bottom: 5px;
      border-bottom: 1px solid rgba($white, .3);
      &_btn {
        @include clearfix;
        button {
          float: right;
          @include btnReset;
          @include font;
          padding: 5px 10px;
          color: $textDark;
          transition: all .3s;
          &:hover {
            &:nth-of-type(even){
              background-color: $primary;
            }
            &:nth-of-type(odd){
              background-color: $danger;
            }
            color: $white;
          }
        }
      }
    }
    .invite_head {
      width: 50px;
      height: 50px;
      background-color: rgba($white, .3);
      border-radius: 50%;
      margin-right: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      >img {
        width: 90%;
        height: 90%;
        object-fit: cover;
        border-radius: 50%;
      }
    }
  }
  @include media(1023px){
    width: 420px;
    margin: auto;
    height: auto;
  }
  @include media(767px){
    width: 100%;
    li{
      width: 100%;
      border-radius: 0;
      padding: 10px 10px 0 10px;
    }
  }
}
</style>
