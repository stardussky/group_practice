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
      @moveList="DRAG_LIST({$event, index})"
    />
    <Tour :steps="steps" />
  </div>
</template>

<script>
import CardContent from '@/components/PM/CardContent/index'
import Card from '@/components/PM/Card/index'
import Tour from '@/components/Tour'
import { ref } from '@vue/composition-api'
import { mapState, mapGetters, mapActions } from 'vuex'
export default {
  name: 'CardView',
  components: {
    CardContent,
    Card,
    Tour
  },
  setup (props, { root }) {
    const steps = ref([
      {
        attachTo: { element: '.card' },
        text: '為你的專案增加一個待辦事項吧',
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
        attachTo: { element: '.card_head', on: 'bottom' },
        text: '幫你的待辦事項取名子',
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
        attachTo: { element: '.invite', on: 'bottom' },
        text: '登入後即可為這個待辦事項指定人員',
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
        attachTo: { element: '.dateComponent ', on: 'bottom' },
        text: '你可以決定是否要設定期限',
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
        attachTo: { element: '.add_todo ', on: 'bottom' },
        text: '試著增加待辦事項的內容吧',
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
        attachTo: { element: '.fileContent label', on: 'bottom' },
        text: '你也可以上傳一些檔案',
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
        attachTo: { element: '.card_footer', on: 'bottom' },
        text: '建立這張待辦事項卡片吧',
        buttons: [
          {
            action () {
              return this.complete()
            },
            text: '完成'
          }
        ]
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
  methods: {
    ...mapActions('pmStore', ['DRAG_LIST'])
  }
}
</script>

<style lang='scss'>
.cardView{
  height: 100%;
  display: flex;
}
</style>
