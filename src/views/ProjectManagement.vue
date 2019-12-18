<template>
  <div class="projectManagement">
    <transition
      name="fade"
      mode="out-in"
    >
      <component
        :is="view"
        :step.sync="step"
      />
    </transition>
  </div>
</template>

<script>
import PMView from '@/components/PM/PMView'
import CardView from '@/components/PM/CardView'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'ProjectManagement',
  components: {
    PMView,
    CardView
  },
  setup () {
    const step = ref('1')
    const view = computed(() => {
      return step.value === '1' ? 'PMView' : 'CardView'
    })
    return {
      step,
      view
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../style/_var';
.projectManagement {
  @include container;
  padding: 20px;
  overflow: auto;
}
.fade-enter, .fade-leave-to{
  opacity: 0;
}
.fade-enter-active, .fade-leave-active{
  transition: opacity .3s;
}
</style>
