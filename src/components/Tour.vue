<template>
  <v-tour
    name="myTour"
    :steps="steps"
    :options="options"
  >
    <template slot-scope="tour">
      <transition-group name="fade">
        <v-step
          v-if="tour.steps[tour.currentStep]"
          :key="tour.currentStep"
          :step="tour.steps[tour.currentStep]"
          :previous-step="tour.previousStep"
          :next-step="tour.nextStep"
          :stop="tour.stop"
          :is-first="tour.isFirst"
          :is-last="tour.isLast"
          :labels="tour.labels"
        />
      </transition-group>
    </template>
  </v-tour>
</template>

<script>
import { ref, onMounted } from '@vue/composition-api'
export default {
  name: 'Tour',
  props: {
    steps: {
      type: Array,
      required: true
    }
  },
  setup (props, { root }) {
    const options = ref({
      useKeyboardNavigation: true,
      labels: {
        buttonSkip: 'Skip',
        buttonPrevious: '上一步',
        buttonNext: '下一步',
        buttonStop: '完成'
      }
    })
    onMounted(() => {
      setTimeout(() => {
        root.$tours['myTour'].start()
      }, 600)
    })
    return {
      options
    }
  }
}
</script>

<style lang='scss'>
.v-step {
  z-index: 9999;
  background-color: $primary !important;
  filter: drop-shadow(1px 1px 3px $shadow) !important;
  border-radius: 20px !important;
  @include font(1);
  .v-step__arrow {
    border-color: $primary !important;
  }
  &[x-placement^=bottom] .v-step__arrow{
    border-left-color: transparent !important;
    border-right-color: transparent !important;
    border-top-color: transparent !important;
  }
  &[x-placement^=top] .v-step__arrow{
    border-left-color: transparent !important;
    border-right-color: transparent !important;
    border-bottom-color: transparent !important;
  }
  &[x-placement^=left] .v-step__arrow{
    border-bottom-color: transparent !important;
    border-right-color: transparent !important;
    border-top-color: transparent !important;
  }
  &[x-placement^=right] .v-step__arrow{
    border-left-color: transparent !important;
    border-bottom-color: transparent !important;
    border-top-color: transparent !important;
  }
  button {
    @include font(1);
    font-family: 'Montserrat', 'Noto Sans TC', sans-serif;
    border-radius: 20px !important;
  }
}
</style>
