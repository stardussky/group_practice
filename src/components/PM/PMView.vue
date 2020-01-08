<template>
  <div class="pmView">
    <div>
      <CreateProject
        :project-index="projectIndex"
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
    <Tour :steps="PMViewSteps" />
  </div>
</template>

<script>
import CreateProject from '@/components/PM/CreateProject'
import Project from '@/components/PM/Project'
import Calendar from '@/components/PM/Calendar/index'
import { mapState, mapActions, mapMutations } from 'vuex'
import Tour from '@/components/Tour'
import tourStep from '@/composition/tour'
export default {
  name: 'PMView',
  components: {
    CreateProject,
    Project,
    Calendar,
    Tour
  },
  setup (props, { refs, root }) {
    const enterProject = (id) => {
      root.$router.push({ name: 'Project', params: { id: id } })
    }
    const { PMViewSteps } = tourStep(root)
    return {
      enterProject,
      PMViewSteps
    }
  },
  computed: {
    ...mapState(['isLogin']),
    ...mapState('pmStore', ['projects']),
    ...mapState('memberStore', ['userInfo']),
    projectIndex () {
      let length = this.projects.length
      return length ? (+this.projects[length - 1].id + 1) + '' : '1'
    }
  },
  mounted () {
    this.clearProjectId()
    if (this.isLogin) this.GET_PROJECTS_LIST(this.userInfo.mem_no)
  },
  methods: {
    ...mapActions('pmStore', ['CREATE_PROJECT', 'GET_PROJECTS_LIST']),
    ...mapMutations('pmStore', ['clearProjectId'])
  }
}
</script>

<style lang='scss'>
.pmView {
  display: flex;
  height: 100%;
}
</style>
