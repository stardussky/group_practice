import { ValidationObserver, ValidationProvider, extend } from 'vee-validate'
import { required, email } from 'vee-validate/dist/rules'

export default {
  install (Vue) {
    Vue.component('ValidationObserver', ValidationObserver)
    Vue.component('ValidationProvider', ValidationProvider)

    extend('required', {
      ...required,
      message: '必填'
    })
    extend('email', {
      ...email,
      message: '請輸入正確電子郵件格式'
    })
  }
}
