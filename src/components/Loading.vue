<template>
  <div class="loading">
    <div>
      <h1>職人口袋 Master Pocket</h1>
      <span />
    </div>
  </div>
</template>

<script>
export default {
  name: 'Loading'
}
</script>

<style lang='scss'>
  .loading {
    width: 100%;
    height: 100vh;
    background-color: $white;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 999999;
    >div {
      >span {
        display: block;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        border: 3px solid $primary;
        border-top-color: rgba(255, 255, 255, 0);
        animation: loadingDot 1s cubic-bezier(.7, 0, 0, .7) infinite;
        margin: auto;
        margin-top: 5px;
      }
    }
    h1 {
      @include font(5);
      white-space: nowrap;
      background-image: linear-gradient(-30deg, rgba($primary, 1), rgba($secondary, 1), rgba($third, 1));
      background-size: 300%;
      -webkit-background-clip: text;
      -webkit-text-fill-color: rgba(255, 255, 255, 0);
      animation: gradientAnimate 3s infinite;
      margin-right: 5px;
    }
    @include media(479px){
      h1{
        @include font(1);
      }
    }
    @keyframes gradientAnimate {
      0% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
      100% {
        background-position: 0% 50%;
      }
    }
    @keyframes loadingDot {
      0% {
        transform: rotate(0);
      }
      100% {
        transform: rotate(360deg);
      }
    }
  }
</style>
