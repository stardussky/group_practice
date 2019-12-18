<template>
  <div class="inviteComponent">
    <div class="title">
      <img
        src="@/assets/icon/multiple-users-silhouette.svg"
        alt="member"
        width="20"
      >
      <p>成員</p>
    </div>
    <div class="members">
      <div class="member" />
      <button class="invite">
        <img
          src="@/assets/icon/plus.svg"
          alt="add"
          width="20"
        >
        <img
          src="@/assets/icon/plus_on.svg"
          alt="add"
          width="20"
        >
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'InviteComponent'
}
</script>

<style lang='scss'>
@import '@/style/_var';
.inviteComponent {
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 5px;
    }
  }
  .members {
    padding-left: 20px;
  }
  .member {
    display: inline-block;
    width: 35px;
    height: 35px;
    background-color: $dark;
    border-radius: 50%;
    background-position: center;
    background-size: cover;
    vertical-align: middle;
    margin: 5px;
  }
  .invite {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 2px solid $dark;
    position: relative;
    outline: none;
    vertical-align: middle;
    background-color: $white;
    @include hoverImg;
    transition: border-color .3s;
    &:hover {
      border-color: $primary;
    }
  }
}
</style>
