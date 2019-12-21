<template>
  <div class="cardView">
    <CreateCard
      :project-id="project.id"
      :todo-id="project.list[0].todo.length"
      :color="project.info.color"
    />
    <CardContent
      v-for="list in project.list"
      :key="list.status"
      :project-id="project.id"
      :list="list"
      :color="project.info.color"
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
  computed: {
    ...mapState('pmStore', ['projects']),
    ...mapGetters('pmStore', ['project'])
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
