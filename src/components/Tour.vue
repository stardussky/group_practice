<template>
  <div class="tour" />
</template>

<script>
import { mapState } from 'vuex'
export default {
  name: 'Tour',
  props: {
    steps: {
      type: Array,
      required: true
    }
  },
  computed: {
    ...mapState(['isLogin'])
  },
  mounted () {
    if (this.isLogin) return
    if (this.$route.meta.tour) {
      this.$nextTick(() => {
        const tour = this.$shepherd({
          useModalOverlay: true,
          defaultStepOptions: {
            classes: 'tour'
          },
          cancelIcon: {
            enabled: true
          }
        })
        tour.addSteps(this.steps)
        setTimeout(() => {
          tour.start()
        }, 100)
      })
    }
  }
}
</script>

<style lang='scss'>
@import '~shepherd.js/dist/css/shepherd.css';
.tour {
  background-color: $primary;
  border-radius: 20px;
  // padding: 10px;
  >.shepherd-arrow {
    // border-bottom-color: $primary !important;
  }
  .shepherd-header{
    // display: none;
    // padding: 20px 10px;
  }
  .shepherd-text {
    color: $white;
    @include font(1);
    padding: 5px 10px;
    margin-bottom: 10px;
  }
  .shepherd-button {
    font-family: 'Montserrat', 'Noto Sans TC', sans-serif;
    @include font;
    padding: 5px 10px;
    border-radius: 20px;
    border: 1px solid $white;
    background-color: $primary;
    &:hover {
      background-color: $white;
      color: $primary;
    }
  }
}
</style>
