<template>
  <div class="projectManagement">
    <CreateCard />
    <CardContent />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent'
import CreateCard from '@/components/PM/CreateCard'
export default {
  name: 'ProjectManagement',
  components: {
    CardContent,
    CreateCard
  }
}
</script>

<style lang="scss" scoped>
@import '../style/_var';
.projectManagement {
  min-width: 1100px;
  @include container;
  display: flex;
  align-items: center;
}
</style>
