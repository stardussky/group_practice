<template>
  <div class="pmView">
    <div>
      <CreateProject
        :id="projects.length"
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
  </div>
</template>

<script>
import CreateProject from '@/components/PM/CreateProject'
import Project from '@/components/PM/Project'
import {} from '@vue/composition-api'
import { mapState, mapActions } from 'vuex'
export default {
  name: 'PMView',
  components: {
    CreateProject,
    Project
  },
  setup (props, { root }) {
    const enterProject = (id) => {
      root.$router.push({ name: 'Project', params: { id: id } })
    }
    return {
      enterProject
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
