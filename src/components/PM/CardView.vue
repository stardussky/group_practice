<template>
  <div class="cardView">
    <transition
      name="fade"
      mode="out-in"
    >
      <CreateCard
        v-if="!isEdit"
        :project-id="project.id"
        :todo-id="project.list[0].todo.length"
        :color="project.info.color"
      />
      <EditCard
        v-else
        :project-id="project.id"
        :edit-card="editCardTarget"
        :color="project.info.color"
      />
    </transition>
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
import CreateCard from '@/components/PM/CreateCard'
import EditCard from '@/components/PM/EditCard'
import { mapState, mapGetters } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    CreateCard,
    EditCard
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapGetters('pmStore', ['project', 'editCardTarget'])
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
