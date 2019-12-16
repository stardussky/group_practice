<template>
  <div class="projectManagement">
    <CardContent />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent'
export default {
  name: 'ProjectManagement',
  components: {
    CardContent
  }
}
</script>

<style lang="scss" scoped>
@import '../style/_var';
.projectManagement {
  @include container;
  display: flex;
  align-items: center;
}
</style>
