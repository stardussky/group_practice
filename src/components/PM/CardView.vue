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
import bus from '@/bus'
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
    ...mapGetters('pmStore', ['project', 'editCardTarget'])
  },
  watch: {
    project (val) {
      if (!val) this.$router.push({ name: 'ProjectManagement' })
    }
  },
  beforeRouteLeave  (to, from, next) {
    if (this.isEdit) {
      let res = null
      let promise = new Promise(resolve => { res = resolve })
      bus.$emit('editDone', res)
      promise.then(() => next())
    } else next()
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
