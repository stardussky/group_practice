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
    />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import Card from '@/components/PM/Card/index'
import { mapState, mapGetters } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    Card
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapGetters('pmStore', ['project', 'editCardTarget'])
  },
  beforeRouteLeave (to, from, next) {
    if (this.isEdit) {
      if (confirm('編輯尚未儲存，是否離開')) next()
    } else {
      next()
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
