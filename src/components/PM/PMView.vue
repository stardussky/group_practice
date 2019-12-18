<template>
  <div class="pmView">
    <div>
      <CreateProject @createProject="setProject" />
    </div>
    <div class="project_area">
      <transition-group
        name="slider"
        tag="div"
      >
        <Project
          v-for="project in projects"
          :key="project.id"
          :project="project"
          :step.sync="nowStep"
        />
      </transition-group>
    </div>
  </div>
</template>

<script>
import CreateProject from '@/components/PM/CreateProject'
import Project from '@/components/PM/Project'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'PMView',
  components: {
    CreateProject,
    Project
  },
  props: {
    step: {
      type: String,
      required: true
    }
  },
  setup (props, { emit }) {
    const projects = ref([])
    const setProject = (project) => {
      projects.value.push(project)
    }
    const nowStep = computed({
      get () {
        return props.step
      },
      set (val) {
        emit('update:step', val)
      }
    })
    return {
      projects,
      setProject,
      nowStep
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.pmView {
  display: flex;
  height: 100%;
  .project_area {
    min-width: 650px;
    height: inherit;
    overflow-y: auto;
  }
}
.slider-enter, .slider-leave-to{
  opacity: 0;
  transform: translateX(-10%);
}
.slider-enter-active, .slider-leave-active{
  transition: all .3s;
}
</style>
