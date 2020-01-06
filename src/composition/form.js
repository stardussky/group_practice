import { ref } from '@vue/composition-api'
export default () => {
  const formInfo = ref([
    {
      fields: [
        {
          component: 'TitleComponent',
          name: 'title',
          content: 'Sign Up'
        },
        {
          component: 'FileComponent',
          type: 'file',
          name: 'headshot',
          value: `${require('@/assets/icon/user.svg')}`
        },
        {
          component: 'InputComponent',
          field: 'Account',
          type: 'text',
          name: 'mem_id',
          placeholder: '請輸入帳號',
          require: 'required',
          value: ''
        },
        {
          component: 'InputComponent',
          field: 'Password',
          type: 'password',
          name: 'mem_psw',
          placeholder: '請輸入密碼',
          require: 'required',
          value: ''
        },
        {
          component: 'InputComponent',
          field: 'Email',
          type: 'email',
          name: 'mem_email',
          placeholder: '請輸入電子信箱',
          require: 'email',
          value: ''
        },
        {
          component: 'ButtonComponent',
          name: 'signup',
          content: 'Sign Up',
          type: 'submit'
        }
      ]
    },
    {
      fields: [
        {
          component: 'TitleComponent',
          name: 'title',
          content: 'Sign In'
        },
        {
          component: 'InputComponent',
          field: 'Account',
          type: 'text',
          name: 'mem_id',
          placeholder: '請輸入帳號',
          require: 'required',
          value: ''
        },
        {
          component: 'InputComponent',
          field: 'Password',
          type: 'password',
          name: 'mem_psw',
          placeholder: '請輸入密碼',
          require: 'required',
          value: ''
        },
        {
          component: 'ButtonComponent',
          name: 'signin',
          content: 'Sign In',
          type: 'submit'
        },
        {
          component: 'ButtonComponent',
          name: 'forget',
          content: 'Forget ?',
          type: 'button'
        }
      ]
    },
    {
      fields: [
        {
          component: 'TitleComponent',
          name: 'title',
          content: 'Reset Password'
        },
        {
          component: 'InputComponent',
          field: 'Email',
          type: 'email',
          name: 'mem_email',
          placeholder: '請輸入電子信箱',
          require: 'email|required',
          value: ''
        },
        {
          component: 'ButtonComponent',
          name: 'reset',
          content: 'Send E-Mail',
          type: 'submit'
        },
        {
          component: 'ButtonComponent',
          name: 'back',
          content: 'Back',
          type: 'button'
        }
      ]
    }
  ])
  return {
    formInfo
  }
}
