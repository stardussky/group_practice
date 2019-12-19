<template>
  <div class="cardView">
    <CreateCard />
    <CardContent
      v-for="list in project.list"
      :key="list.status"
      :list="list"
    />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import CreateCard from '@/components/PM/CreateCard/index'
import { mapState, mapGetters } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    CreateCard
  },
  provide () {
    return {
      color: this.project.info.color
    }
  },
  computed: {
    ...mapState('pmStore', ['projects']),
    ...mapGetters('pmStore', ['project'])
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.cardView{
  height: 100%;
  display: flex;
}
</style>
