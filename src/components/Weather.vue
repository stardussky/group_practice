<template>
  <div class="weather">
    <img src="@/assets/icon/cloudy.svg">
    <div>
      <p>20°</p>
      <p>桃園市</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Weather'
}
</script>

<style lang='scss'>
@import '../style/_var';
.weather {
  position: fixed;
  bottom: 30px;
  left: 40px;
  > img {
    width: 60px;
    vertical-align: middle;
  }
  > div {
    display: inline-block;
    color: $white;
    margin-left: 10px;
    vertical-align: middle;
    > p:nth-of-type(1) {
      font-weight: 400;
      @include font(5);
    }
    > p:nth-of-type(2) {
      @include font(2);
    }
  }
  @include media(479px){
    top: 80px;
    bottom: auto;
    left: 10px;
    > img {
      width: 40px;
    }
    > div {
      > p:nth-of-type(1) {
        @include font;
      }
      > p:nth-of-type(2) {
        @include font;
      }
    }
  }
}
</style>
