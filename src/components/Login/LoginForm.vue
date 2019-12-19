<template>
  <ValidationObserver
    v-slot="{passes}"
    tag="div"
    class="loginFrom"
  >
    <form @submit.prevent="passes(submit)">
      <div class="select_mode">
        <button
          type="button"
          :class="{active: mode === 0}"
          @click="mode = 0"
        >
          Sign Up
        </button>
        <button
          type="button"
          :class="{active: mode === 1}"
          @click="mode = 1"
        >
          Sign In
        </button>
      </div>
      <div class="form_field">
        <transition-group
          tag="div"
          name="flip"
        >
          <component
            :is="input.component"
            v-for="input in formInfo[mode].fields"
            :key="input.name"
            v-model="input.value"
            :rules="input.require"
            :placeholder="input.placeholder"
            :name="input.name"
            :type="input.type"
            :field="input.field"
          />
          <button
            key="button"
            class="submit"
          >
            {{ mode ? 'Sign In' : 'Sign Up' }}
          </button>
        </transition-group>
      </div>
    </form>
  </ValidationObserver>
</template>

<script>
import InputComponent from './InputComponent'
import FileComponent from './FileComponent'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'LoginForm',
  components: {
    InputComponent,
    FileComponent
  },
  setup () {
    const mode = ref(0)
    const formInfo = ref([
      {
        fields: [
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
            name: 'memId',
            placeholder: '請輸入帳號',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Password',
            type: 'password',
            name: 'memPsw',
            placeholder: '請輸入密碼',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Email',
            type: 'email',
            name: 'email',
            placeholder: '請輸入電子信箱',
            require: 'email',
            value: ''
          }
        ]
      },
      {
        fields: [
          {
            component: 'InputComponent',
            field: 'Account',
            type: 'text',
            name: 'memId',
            placeholder: '請輸入帳號',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Password',
            type: 'password',
            name: 'memPsw',
            placeholder: '請輸入密碼',
            require: 'required',
            value: ''
          }
        ]
      }
    ])
    const userData = computed(() => {
      return formInfo.value[mode.value].fields.reduce((prev, info) => {
        prev[info.name] = info.value
        return prev
      }, [])
    })
    const submit = () => {
      console.log('submit: ', userData.value)
      formInfo.value[mode.value].fields.forEach(info => {
        if (info.name === 'headshot')info.value = `${require('@/assets/icon/user.svg')}`
        else info.value = ''
      })
    }
    return {
      mode,
      formInfo,
      submit
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_formButton';
.loginFrom {
  width: 50%;
  height: 100%;
  >form{
    width: 100%;
    height: 100%;
    position: relative;
  }
  .select_mode {
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 1;
    @include switchBtn;
  }
  .form_field {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    background-color: rgba($white, .65);
    padding: 0 10%;
    >div {
      width: 250px;
    }
  }
  .submit{
    @include baseBtn;
  }
  @include media(1023px){
    width: 100%;
  }
  @include media(479px){
    .select_mode{
      right: 50%;
      transform: translateX(50%);
    }
  }
}
.flip-move{
  transition: all .3s;
}
.flip-enter, .flip-leave-to{
  opacity: 0;
}
.flip-leave-active{
  position: absolute;
}
</style>
