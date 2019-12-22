<template>
  <div class="clockFace">
    <div class="wrapper">
      <div class="left" />
      <div class="right none" />
    </div>
    <div class="content" />
  </div>
</template>

<script>
export default {
  name: 'ClockFace'
}
</script>

<style lang='scss'>
  $clockSize: 30vw;
  $borderWidth: 15px;
  .clockFace {
    width: $clockSize;
    height: $clockSize;
    position: relative;
    border-radius: 50%;
    background-color: $white;
    .wrapper, .left, .right{
      width: $clockSize;
      height: $clockSize;
      position: absolute;
      border-radius: 50%;
    }
    .wrapper {
      border: $borderWidth solid $white;
      clip: rect(0, $clockSize, $clockSize, $clockSize/2);
      &.auto {
        clip: auto;
      }
      .left, .right {
        top: -$borderWidth;
        left: -$borderWidth;
        // border: $borderWidth solid $danger;
        // background-image: linear-gradient(to right, $primary, $danger);
      }
      .left {
        clip: rect(0, $clockSize/2, $clockSize, 0);
        transform: rotate(0deg);
        background-image: linear-gradient(to right, $primary, $danger);
      }
      .right {
        clip: rect(0, $clockSize, $clockSize, $clockSize/2);
        transform: rotate(0deg);
        background-image: linear-gradient(to left, $primary, $danger);
        &.none {
          width: 0;
        }
      }
    }
    .content {
      @include positionCenter;
      // width: calc(#{$clockSize} - #{$borderWidth});
      // height: calc(#{$clockSize} - #{$borderWidth});
      background-color: $dark;
      border-radius: 50%;
    }
  }

</style>
