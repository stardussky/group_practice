<template>
  <div class="clockFace">
    <svg
      id="svg"
      width="30vw"
      height="30vw"
      viewPort="0 0 155 155"
      version="1.1"
      xmlns="http://www.w3.org/2000/svg"
    >
      <defs>
        <linearGradient
          id="gradient"
          x1="0"
          x2="0"
          y1="0"
          y2="1"
        >
          <stop offset="0%" />
          <stop offset="100%" />
        </linearGradient>
      </defs>
      <circle
        r="40%"
        cx="50%"
        cy="50%"
      />
      <circle
        id="bar"
        r="40%"
        cx="50%"
        cy="50%"
      />
      <circle
        id="outside"
        r="45%"
        cx="50%"
        cy="50%"
      />
      <text
        id="timer"
        x="50%"
        y="50%"
      >25:00</text>
    </svg>
  </div>
</template>

<script>
export default {
  name: 'ClockFace'
}
</script>

<style lang='scss'>
  .clockFace {
    display: flex;
    justify-content: center;
    #svg {
      max-width: 350px;
      min-width: 150px;
      max-height: 350px;
      min-height: 150px;
      circle {
        stroke-linecap: round;
        fill: transparent;
        stroke: $white;
        stroke-width: 4px;
        stroke-dasharray: 1000;
        stroke-dashoffset: 0;
        transition: stroke-dashoffset 1s linear;
      }
      #gradient {
        stop {
          &:nth-of-type(1){
            stop-color: $primary;
          }
          &:nth-of-type(2){
            stop-color: $third;
          }
        }
      }
      #bar {
        fill: rgba($white, .5);
        stroke: url(#gradient);
        stroke-dashoffset: 400;
      }
      #outside {
        stroke-width: 1px;
      }
      #timer {
        dominant-baseline:middle;
        text-anchor:middle;
        @include font(8);
        fill: $dark;
        transition: all 1s;
      }
    }
    @include media(767px){
      height: 100%;
      align-items: center;
      justify-content: flex-start;
      #svg{
        #timer {
          @include font(5);
        }
      }
    }
  }
</style>
