<template>
  <div class="todoContent">
    <div class="title">
      <p>寫專案</p>
      <div>
        <img
          src="@/assets/icon/delete.svg"
          alt="delete"
          width="20"
        >
        <img
          src="@/assets/icon/delete_on.svg"
          alt="delete"
          width="20"
        >
      </div>
    </div>
    <div class="progerss">
      <p>50%</p>
      <div class="bar">
        <span />
      </div>
    </div>
    <ul class="content">
      <ContentList />
    </ul>
  </div>
</template>

<script>
import ContentList from './ContentList'
export default {
  name: 'TodoContent',
  components: {
    ContentList
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.todoContent {
  padding: 5px 0;
  .title {
    @include font(1);
    position: relative;
    >div {
      @include positionCenter(y);
      @include hoverImg;
      right: 0;
      width: 20px;
      height: 20px;
    }
  }
  .progerss {
    margin: 5px 0;
    display: flex;
    align-items: center;
    .bar {
      width: 100%;
      height: 5px;
      border-radius: 5px;
      border: 1px solid $shadow;
      margin-left: 5px;
      position: relative;
      >span {
        position: absolute;
        top: 0;
        left: 0;
        width: 50%;
        height: 100%;
        border-radius: 5px;
        background-color: $primary;
      }
    }
  }
  .content {
    list-style: none;
  }
}
</style>
