<template>
  <nav
    class="navbarComponent"
    :class="{buttonActive: isOpen}"
    @click="isOpen = !isOpen"
  >
    <div class="hamburger">
      <div class="navBtn">
        <div class="navBtn_btn">
          <p>MENU</p>
          <div>
            <span />
          </div>
        </div>
      </div>
    </div>
    <ul class="list">
      <li>
        <div class="navBtn">
          <a
            href="./program.html"
            class="navBtn_btn"
          >
            <p>專案管理</p>
            <div>
              <img
                src="@/assets/icon/briefing.svg"
                width="20"
              >
            </div>
          </a>
        </div>
      </li>
      <li>
        <div class="navBtn">
          <a
            href="./tomato.html"
            class="navBtn_btn"
          >
            <p>番茄鐘</p>
            <div>
              <img
                src="@/assets/icon/time-left.svg"
                width="20"
              >
            </div>
          </a>
        </div>
      </li>
      <li>
        <div class="navBtn">
          <a
            href="./mall.html"
            class="navBtn_btn"
          >
            <p>商城</p>
            <div>
              <img
                src="@/assets/icon/shopping-bag.svg"
                width="20"
              >
            </div>
          </a>
        </div>
      </li>
      <li>
        <div class="navBtn">
          <a
            :href="isLogin ? './member.html' : './member_login.html'"
            class="navBtn_btn"
          >
            <p>會員中心</p>
            <div>
              <img
                src="@/assets/icon/user.svg"
                width="20"
              >
            </div>
          </a>
        </div>
      </li>
    </ul>
    <span class="mask" />
  </nav>
</template>

<script>
import { ref } from '@vue/composition-api'
export default {
  name: 'NavbarComponent',
  props: {
    isLogin: {
      type: Boolean,
      required: true
    }
  },
  setup () {
    const isOpen = ref(false)
    return {
      isOpen
    }
  }
}
</script>

<style lang='scss'>
.navbarComponent {
  position: fixed;
  top: 30px;
  right: 40px;
  z-index: 99;
  > .hamburger {
    > .navBtn {
      @include button(60px, true);
    }
  }
  .mask {
    display: inline-block;
    position: fixed;
    top: 0;
    right: 0;
    width: 0;
    height: 100%;
    background-color: transparent;
    z-index: -1;
    &::before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      width: 0;
      height: 100%;
      background-color: rgba($dark, .9);
      transition: width .3s;
    }
  }
  .list {
    list-style: none;
    height: 0;
    visibility: hidden;
    opacity: 0;
    > li {
      opacity: 0;
      transition: opacity 0.3s;
      margin-bottom: 10px;
      > .navBtn {
        @include button;
      }
    }
  }
  &.buttonActive {
    >.mask {
      width: 100%;
      &::before {
        width: 250px;
      }
    }
    > .hamburger {
      > .navBtn {
        @include buttonActive(true);
      }
    }
    > .list {
      visibility: visible;
      opacity: 1;
      height: auto;
      > li {
        opacity: 1;
        @for $i from 0 through 4 {
          &:nth-of-type(#{$i}) {
            transition-delay: 0.15s * $i;
          }
        }
      }
    }
  }
  @include media(1023px){
    top: 10px;
    right: 10px;
    &.buttonActive {
      >.mask {
        &::before {
          width: 220px;
        }
      }
    }
  }
  @include media(479px){
    &.buttonActive {
      >.mask {
        &::before {
          width: 60px;
        }
      }
    }
  }
}
</style>
