import { ref } from '@vue/composition-api'
export default (root, bus) => {
  const PMViewSteps = ref([
    {
      attachTo: { element: '.createProject', on: 'right' },
      text: '歡迎來到專案管理頁面,是否進入教學',
      buttons: [
        {
          action () {
            root.$route.meta.tour = false
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
            root.$route.meta.tour = false
            return this.complete()
          },
          text: '我知道了'
        }
      ]
    }
  ])
  const CardViewSteps = ref([
    {
      attachTo: { element: '.card' },
      text: '為你的專案增加一個待辦事項吧',
      buttons: [
        {
          action () {
            root.$route.meta.tour = false
            return this.complete()
          },
          text: 'Skip'
        },
        {
          action () {
            bus.$emit('tourMode', true)
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
      attachTo: { element: '.inviteComponent', on: 'bottom' },
      text: '如果是多人專案即可指定此待辦事項成員',
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
      attachTo: { element: '.contentList ', on: 'bottom' },
      text: '建立事項後可以將這件事情加入番茄鐘',
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
      text: '這裡可以上傳檔案',
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
            bus.$emit('tourMode', false)
            root.$route.meta.tour = false
            return this.complete()
          },
          text: '完成'
        }
      ]
    }
  ])
  return {
    PMViewSteps,
    CardViewSteps
  }
}
