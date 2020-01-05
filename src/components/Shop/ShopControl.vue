<template>
  <div class="shop_control">
    <div class="item_img">
      <img
        src="https://images.unsplash.com/photo-1562887085-cb16e9116582?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80"
        alt=""
      >
    </div>
    <div class="control_dots">
      <div class="info">
        <svg height="50">
          <text
            x="50%"
            y="50%"
          >01</text>
        </svg>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ratione nihil tempore libero excepturi expedita in doloribus dolores odio veritatis sit perferendis ipsum</p>
      </div>
      <div class="dots">
        <span />
        <span />
        <span />
        <span />
        <span />
      </div>
    </div>
    <div class="control_btn">
      <button>
        <!-- <img src="" alt="right"> -->
      </button>
      <button>
        <img
          src="@/assets/icon/back.svg"
          alt="left"
        >
        <img
          src="@/assets/icon/back_on.svg"
          alt="left"
        >
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ShopControl'
}
</script>

<style lang='scss'>
.shop_control{
  position: absolute;
  bottom: 10px;
  left: 0;
  height: 150px;
  display: flex;
  .item_img {
    width: 250px;
    height: 100%;
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 0 0 0 20px;
    }
  }
  .control_dots {
    width: 300px;
    height: 100%;
    background-image: linear-gradient(to right, rgba($secondary, .9),  rgba($third, .9));
    padding: 50px 20px 10px;
    position: relative;
    .info {
      display: flex;
      align-items: center;
      svg {
        text {
          dominant-baseline:middle;
          text-anchor:middle;
          @include font(12);
          stroke: $textDark;
          fill: transparent;
          transition: all 1s;
        }
      }
      > p{
        word-wrap: break-word;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        @include font(-.875);
        margin-left: 20px;
      }
    }
    .dots {
      width: 260px;
      position: absolute;
      bottom: 10px;
      text-align: center;
      span {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background-color: $white;
        &:not(:nth-last-of-type(1)){
          margin-right: 20px;
        }
        cursor: pointer;
      }
    }
  }
  .control_btn {
    height: 100%;
    button {
      display: block;
      @include btnReset;
      @include hoverImg(20px);
      width: 40px;
      height: 50%;
      background-color: $dark;
      position: relative;
    }
  }
}
</style>
