<template>
  <div class="cardView">
    <CardContent />
    <CreateCard />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import CreateCard from '@/components/PM/CreateCard/index'
export default {
  name: 'CardView',
  components: {
    CardContent,
    CreateCard
  }
}
</script>

<style>

</style>
