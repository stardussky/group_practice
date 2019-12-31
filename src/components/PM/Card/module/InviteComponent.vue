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
      <!-- <div class="member" /> -->
      <button class="invite">
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
  </div>
</template>

<script>
export default {
  name: 'InviteComponent'
}
</script>

<style lang='scss'>
.inviteComponent {
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
    flex-wrap: wrap;
    padding-left: 30px;
    min-height: 45px;
  }
  .member {
    width: 35px;
    height: 35px;
    background-color: $dark;
    border-radius: 50%;
    background-position: center;
    background-size: cover;
    margin: 0 5px 5px 0;
  }
  .invite {
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
