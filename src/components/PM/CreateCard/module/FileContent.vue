<template>
  <div class="fileContent">
    <div class="title">
      <img
        src="@/assets/icon/paperclip.svg"
        alt="paperclip"
        width="20"
      >
      <p>附件</p>
    </div>
    <div class="files">
      <ul>
        <li>
          <a href="#">XXX</a>
          <div>
            <img
              src="@/assets/icon/delete.svg"
              alt="delete"
            >
            <img
              src="@/assets/icon/delete_on.svg"
              alt="delete"
            >
          </div>
        </li>
      </ul>
      <label :style="{backgroundColor: color}">
        <p>上傳附件</p>
        <input type="file">
      </label>
    </div>
  </div>
</template>

<script>
export default {
  name: 'FileContent',
  inject: ['color']
}
</script>

<style lang='scss'>
.fileContent {
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 5px;
    }
  }
  .files {
    padding: 5px 0 0 20px;
    ul{
      color: $dark;
      list-style-position: inside;
      list-style-type: disc;
      @include font(1);
      li {
        position: relative;
        div{
          @include hoverImg(20px);
          @include positionCenter(y);
          right: 0;
        }
        a {
          color: $dark;
          text-decoration: none;
        }
      }
    }
    >label {
      display: inline-block;
      @include font;
      color: $white;
      border-radius: 5px;
      padding: 5px;
      margin: 10px 0 5px;
      cursor: pointer;
      input {
        position: fixed;
        opacity: 0;
        visibility: hidden;
      }
    }
  }
}
</style>
