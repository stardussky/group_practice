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
import { ref } from '@vue/composition-api'
import { mapState, mapActions } from 'vuex'
import Tour from '@/components/Tour'
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
    const steps = ref([
      {
        attachTo: { element: '.createProject', on: 'right' },
        text: '歡迎來到專案管理頁面,是否進入教學',
        buttons: [
          {
            action () {
              return this.complete()
            },
            text: 'Skip'
          },
          {
            action () {
              return this.next()
            },
            text: '教學'
          }
        ]
      },
      {
        attachTo: { element: '.createProject input', on: 'bottom' },
        text: '輸入你的專案名稱',
        buttons: [
          {
            action () {
              return this.next()
            },
            text: '下一步'
          }
        ]
      },
      {
        attachTo: { element: '.project_color', on: 'bottom' },
        text: '選擇你的專案色',
        buttons: [
          {
            action () {
              return this.next()
            },
            text: '下一步'
          }
        ]
      },
      {
        attachTo: { element: '.createProject button', on: 'left' },
        text: '建立一個專案',
        buttons: [
          {
            action () {
              return this.next()
            },
            text: '完成'
          }
        ]
      },
      {
        attachTo: { element: '.calendar_view', on: 'right' },
        text: '登入後，側邊行事曆會提醒你 7 天以內快到期的專案待辦事項',
        buttons: [
          {
            action () {
              return this.complete()
            },
            text: '我知道了'
          }
        ]
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
