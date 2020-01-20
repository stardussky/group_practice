<template>
  <div class="inviteComponent">
    <div class="title">
      <img
        src="@/assets/icon/multiple-users-silhouette.svg"
        alt="member"
        width="20"
      >
      <p>專案成員</p>
    </div>
    <div class="members">
      <div
        v-for="member in projectMember"
        :key="member.mem_no"
        class="member"
      >
        <img
          :src="memberHeadShot"
          :title="member.mem_name || member.mem_id"
          alt="member"
        >
      </div>
      <button
        class="invite_btn"
        @click="open = !open"
      >
        <img
          src="@/assets/icon/plus.svg"
          alt="add"
        >
        <img
          src="@/assets/icon/plus_on.svg"
          alt="add"
        >
      </button>
    </div>
    <div
      class="invite"
      :class="{active: open}"
    >
      <div class="invite_input">
        <input
          v-model.trim="inviteAccount"
          type="text"
          placeholder="邀請帳號"
          @keydown.enter="inviteMember"
        >
        <div>
          <img
            src="@/assets/icon/search.svg"
            alt="search"
          >
          <img
            src="@/assets/icon/search.svg"
            alt="search"
          >
        </div>
      </div>
      <p
        v-if="result"
        class="invite_status"
        :class="result.status"
      >
        {{ result.content }}
      </p>
    </div>
  </div>
</template>

<script>
import { ref, computed } from '@vue/composition-api'
import { mapActions } from 'vuex'
export default {
  name: 'InviteComponent',
  props: {
    projectMember: {
      type: Array,
      required: true
    }
  },
  setup (props) {
    const open = ref(false)
    const inviteAccount = ref(null)
    const result = ref(null)
    const memberHeadShot = computed(() => {
      return props.projectMember.headshot
        ? `./userImg/${props.userInfo.headshot}`
        : `${require('@/assets/icon/user.svg')}`
    })
    return {
      open,
      memberHeadShot,
      inviteAccount,
      result
    }
  },
  methods: {
    ...mapActions('memberStore', ['INVITE_MEMBER']),
    async inviteMember () {
      if (this.inviteAccount) {
        this.result = await this.INVITE_MEMBER(this.inviteAccount)
        this.inviteAccount = null
      }
    }
  }
}
</script>

<style lang='scss'>
.inviteComponent {
  @include font;
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 10px;
    }
  }
  .members {
    display: flex;
    align-items: center;
    padding-left: 30px;
    overflow-x: auto;
    &::-webkit-scrollbar {
      height: 3px;
    }
    &::-webkit-scrollbar-thumb {
      background-color: $dark;
    }
  }
  .member {
    flex-shrink: 0;
    width: 30px;
    height: 30px;
    background-color: rgba($dark, 1);
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 5px;
    >img {
      width: 90%;
      height: 90%;
      object-fit: cover;
      border-radius: 50%;
    }
  }
  .invite {
    max-height: 0;
    opacity: 0;
    visibility: hidden;
    transition: max-height .3s;
    &_input {
      @include font;
      position: relative;
      input {
        width: 100%;
        height: 0;
        @include inputReset;
        border: none;
        border-bottom: 1px solid $dark;
        padding: 0 30px 0 5px;
        margin: 5px 0;
        transition: height .3s;
        &::-webkit-input-placeholder{
          @include font;
          color: $dark;
          text-align: center;
        }
      }
      div {
        @include positionCenter(y);
        right: 0;
        @include hoverImg(30px);
      }
    }
    .invite_status {
      text-align: center;
      padding: 0 30px 0 5px;
      &.error {
        color: $danger;
      }
      &.success{
        color: $success;
      }
    }
    &.active {
      max-height: 60px;
      opacity: 1;
      visibility: visible;
      .invite_input {
        input {
          height: 30px;
        }
      }
    }
  }
  .invite_btn {
    flex-shrink: 0;
    border-radius: 50%;
    border: 2px solid $dark;
    position: relative;
    outline: none;
    background-color: $white;
    @include hoverImg(25px);
    transition: border-color .3s;
    &:hover {
      border-color: $primary;
    }
  }
  @include media(479px){
    .members {
      min-height: 40px;
    }
    .member {
      width: 30px;
      height: 30px;
    }
  }
}
</style>
