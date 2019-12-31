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
    <Tour :steps="steps" />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import Card from '@/components/PM/Card/index'
import Tour from '@/components/Tour'
import { ref } from '@vue/composition-api'
import { mapState, mapGetters } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    Card,
    Tour
  },
  setup () {
    const steps = ref([
      {
        target: '[data-v-step="2"]',
        content: `建立一張專案代辦事項卡片`,
        params: {
          placement: 'top'
        }
      },
      {
        target: '.invite',
        content: `登入後即可邀請成員`
      },
      {
        target: '[data-v-step="3"]',
        content: `這裡可以設定卡片期限`,
        params: {
          placement: 'bottom'
        }
      },
      {
        target: '[data-v-step="4"]',
        content: '增加一個卡片內容吧'
      }
    ])
    return {
      steps
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit']),
    ...mapGetters('pmStore', ['project', 'editCardTarget'])
  },
  beforeRouteLeave (to, from, next) {
    if (this.isEdit) {
      if (confirm('編輯尚未儲存,是否取消編輯?')) next()
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
