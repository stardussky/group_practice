<template>
  <div class="cardView">
    <Card
      :project-id="project.id"
      :is-edit="isEdit"
      :edit-card="isEdit?editCardTarget:{}"
      :color="project.info.color"
    />
    <CardContent
      v-for="(list, index) in project.list"
      :key="list.status"
      :project-id="project.id"
      :list="list"
      :color="project.info.color"
      :step="index"
      @moveList="DRAG_LIST({$event, index})"
    />
    <Tour :steps="CardViewSteps" />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import Card from '@/components/PM/Card/index'
import Tour from '@/components/Tour'
import tourStep from '@/composition/tour'
import { mapState, mapGetters, mapActions } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    Card,
    Tour
  },
  setup (props, { root }) {
    const { CardViewSteps } = tourStep(root)
    return {
      CardViewSteps
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapGetters('pmStore', ['project', 'editCardTarget'])
  },
  methods: {
    ...mapActions('pmStore', ['DRAG_LIST'])
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
