<template>
  <div class="cardView">
    <Card
      :project-id="project.id"
      :card-id="cardIndex"
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
      @closeDrag="closeDrag"
    />
    <Tour :steps="CardViewSteps" />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import Card from '@/components/PM/Card/index'
import Tour from '@/components/Tour'
import tourStep from '@/composition/tour'
import { mapState, mapGetters } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    Card,
    Tour
  },
  setup (props, { root, emit }) {
    const { CardViewSteps } = tourStep(root)
    const closeDrag = () => emit('closeDrag')
    return {
      CardViewSteps,
      closeDrag
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapState('memberStore', ['cardId']),
    ...mapGetters('pmStore', ['project', 'editCardTarget']),
    cardIndex () {
      return this.cardId ? this.cardId + '' : ''
    }
  },
  watch: {
    project (val) {
      if (!val) this.$router.push({ name: 'ProjectManagement' })
    }
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
