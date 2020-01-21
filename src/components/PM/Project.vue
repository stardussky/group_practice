<template>
  <div class="project">
    <p @click="enterProject">
      <span :style="{backgroundColor:project.info.color}" />
      {{ project.info.title }}
    </p>
    <div
      v-if="project.memberList"
      class="project_members"
    >
      <div
        v-for="member in project.memberList"
        :key="member.mem_no"
        class="member"
      >
        <img
          :src="member.headshot ? `./userImg/${member.headshot}` : require('@/assets/icon/user.svg')"
          :title="member.mem_name || member.mem_id"
          alt="member"
        >
      </div>
    </div>
    <div class="invite">
      <p
        v-if="result"
        class="invite_status"
        :class="result.status"
      >
        {{ result.content }}
      </p>
      <div class="invite_input">
        <input
          v-model.trim="inviteAccount"
          type="text"
          placeholder="邀請帳號"
          :style="{backgroundColor:project.info.color}"
          @keydown.enter="inviteMember"
        >
        <div @click="inviteMember">
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
    </div>
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
import { mapActions } from 'vuex'
export default {
  name: 'Project',
  props: {
    project: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const inviteAccount = ref(null)
    const result = ref(null)
    const enterProject = () => emit('enterProject', props.project.id)
    return {
      inviteAccount,
      result,
      enterProject
    }
  },
  methods: {
    ...mapActions('memberStore', ['INVITE_MEMBER']),
    async inviteMember () {
      if (this.inviteAccount) {
        this.result = await this.INVITE_MEMBER({ account: this.inviteAccount, projectId: this.project.id })
        this.inviteAccount = null
      }
    }
  }
}
</script>

<style lang='scss'>
.project {
  display: inline-block;
  width: 300px;
  min-height: 150px;
  background-color: rgba($white, .8);
  border-radius: 20px;
  box-shadow: 1px 1px 3px $shadow;
  margin: 0 10px 5px 10px;
  overflow: hidden;
  z-index: 1;
  &_members {
    width: 100%;
    padding: 5px 5px 0;
    .member {
      width: 30px;
      height: 30px;
      background-color: rgba($dark, 1);
      border-radius: 50%;
      margin: 0 2.5px;
      display: inline-flex;
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
  .invite {
    @include font;
    &_input {
      position: relative;
      input {
        width: 100%;
        height: 30px;
        @include inputReset;
        border: none;
        padding: 0 30px 0 5px;
        transition: height .3s;
        color: $white;
        &::-webkit-input-placeholder{
          @include font;
          color: $white;
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
  }
  >p{
    height: 120px;
    @include font(2);
    padding: 25px 10px 0;
    word-break: break-word;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    border-bottom: 1px solid rgba($dark, .3);
    cursor: pointer;
    position: relative;
    z-index: 1;
    >span {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 20px;
      transition: all .3s;
      z-index: -1;
    }
    &:hover {
      >span {
        height: 100%;
        opacity: .5;
      }
    }
  }
}
</style>
