<template>
  <div class="pmView">
    <div>
      <CreateProject
        @createProject="CREATE_PROJECT"
      />
    </div>
    <transition-group
      name="slider"
      tag="div"
    >
      <Project
        v-for="project in projects"
        :key="project.id"
        :project="project.info"
        @click.native="enterProject(project.id)"
      />
    </transition-group>
    <Calendar />
    <Tour :steps="steps" />
  </div>
</template>

<script>
import CreateProject from '@/components/PM/CreateProject'
import Project from '@/components/PM/Project'
import Calendar from '@/components/PM/Calendar/index'
import Tour from '@/components/Tour'
import { ref } from '@vue/composition-api'
import { mapState, mapActions } from 'vuex'
export default {
  name: 'PMView',
  components: {
    CreateProject,
    Project,
    Calendar,
    Tour
  },
  setup (props, { root }) {
    const enterProject = (id) => {
      root.$router.push({ name: 'Project', params: { id: id } })
    }
    const steps = ref([
      {
        target: '.createProject',
        content: `從這裡開始建立新的專案`
      },
      {
        target: '[data-v-step="0"]',
        content: `輸入你的專案名稱`,
        params: {
          placement: 'bottom'
        }
      },
      {
        target: '.project_color',
        content: '選擇專案顏色'
      },
      {
        target: '[data-v-step="1"]',
        content: '新增一個專案吧',
        params: {
          placement: 'top'
        }
      }
    ])
    return {
      enterProject,
      steps
    }
  },
  computed: {
    ...mapState('pmStore', ['projects'])
  },
  methods: {
    ...mapActions('pmStore', ['CREATE_PROJECT'])
  }
}
</script>

<style lang='scss'>
.pmView {
  display: flex;
  height: 100%;
}
</style>
