<template>
  <div class="inviteComponent">
    <div class="title">
      <img
        src="@/assets/icon/multiple-users-silhouette.svg"
        alt="member"
        width="20"
      >
      <p>卡片成員</p>
    </div>
    <div class="members">
      <div
        v-for="num in 2"
        :key="num"
        class="member"
      >
        <img
          :src="require('@/assets/icon/user.svg')"
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
      class="member_list"
      :class="{open: open}"
    >
      <p>專案成員</p>
      <ul>
        <li
          v-for="member in memberList"
          :key="member.mem_no"
        >
          <div
            class="checked"
            @click="addCardMember(member)"
          >
            <img
              v-if="!member.status"
              src="@/assets/icon/unchecked_d.svg"
              alt="unchecked"
              width="20"
            >
            <img
              v-else
              src="@/assets/icon/checked_d.svg"
              alt="checked"
              width="20"
            >
          </div>
          <div class="member">
            <img
              :src="member.headshot ? `./userImg/${member.headshot}` : require('@/assets/icon/user.svg')"
              alt="member"
            >
          </div>
          <p>{{ member.mem_name || member.mem_id }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
import { } from 'vuex'
export default {
  name: 'InviteComponent',
  props: {
    memberList: {
      type: Array,
      required: true
    }
  },
  setup (props, { emit }) {
    const open = ref(false)
    const addCardMember = (member) => emit('addCardMember', member)
    return {
      open,
      addCardMember
    }
  },
  methods: {

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
    padding-bottom: 5px;
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
  .member_list {
    max-height: 0;
    visibility: hidden;
    opacity: 0;
    border-top: 1px solid rgba($dark, .3);
    padding-left: 30px;
    transition: max-height .3s;
    &.open {
      max-height: 131px;
      visibility: visible;
      opacity: 1;
    }
    >p {
      margin: 5px 0;
    }
    .member {
      width: 25px;
      height: 25px;
      margin-right: 10px;
    }
    .checked {
      display: flex;
      align-items: center;
      margin-right: 10px;
      cursor: pointer;
    }
    ul {
      max-height: 100px;
      overflow-y: auto;
      li {
        display: flex;
        align-items: center;
        margin-bottom: 5px;
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
