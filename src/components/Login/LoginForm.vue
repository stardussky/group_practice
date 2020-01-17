<template>
  <ValidationObserver
    ref="form"
    v-slot="{passes, reset}"
    tag="div"
    class="loginFrom"
    :class="{mode: mode}"
  >
    <div class="select_mode">
      <button
        type="button"
        :class="{active: !mode}"
        @click="changeMode = 0"
      >
        Sign Up
      </button>
      <button
        type="button"
        :class="{active: mode}"
        @click="changeMode = 1"
      >
        Sign In
      </button>
    </div>
    <form @submit.prevent="passes(submit)">
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
            :content="input.content"
          >
            <template v-slot:slotButton>
              <button
                v-if="input.name === 'forget'"
                :type="input.type"
                @click="changeMode = 2"
              >
                {{ input.content }}
              </button>
              <button
                v-else-if="input.name === 'back'"
                :type="input.type"
                @click="changeMode = 1"
              >
                {{ input.content }}
              </button>
              <button
                v-else
                :type="input.type"
              >
                {{ input.content }}
              </button>
            </template>
          </component>
        </transition-group>
      </div>
    </form>
  </ValidationObserver>
</template>

<script>
import InputComponent from './module/InputComponent'
import FileComponent from './module/FileComponent'
import TitleComponent from './module/TitleComponent'
import ButtonComponent from './module/ButtonComponent'
import { computed, watch } from '@vue/composition-api'
import { mapActions } from 'vuex'
import form from '@/composition/form'
export default {
  name: 'LoginForm',
  components: {
    InputComponent,
    FileComponent,
    ButtonComponent,
    TitleComponent
  },
  props: {
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit, refs }) {
    const { formInfo } = form()
    const changeMode = computed({
      get () {
        return props.mode
      },
      set (val) {
        emit('update:mode', val)
      }
    })
    const inputFileInfo = computed(() => {
      return formInfo.value[props.mode].fields.reduce((prev, info, index, arr) => {
        if (info.value) {
          if (info.type === 'file') {
            prev[info.name] = info.value.src
            prev.file_ext = info.value.extension
            prev.file_type = info.value.type
          } else {
            prev[info.name] = info.value
          }
        }
        return prev
      }, {})
    })
    const url = computed(() => props.mode ? './php/member/login.php' : './php/member/signup.php')
    watch(() => props.mode, () => {
      requestAnimationFrame(() => {
        refs.form.reset()
      })
    }, { lazy: true })
    return {
      changeMode,
      formInfo,
      url,
      inputFileInfo
    }
  },
  methods: {
    ...mapActions('memberStore', ['SUBMIT']),
    async submit () {
      this.$refs.form.reset()
      let result = await this.SUBMIT({ url: this.url, data: this.inputFileInfo })
      if (result.content === '註冊成功') this.changeMode = 1
      if (result.status === 'success') {
        this.formInfo[this.mode].fields.forEach(info => {
          if (info.type === 'file') info.value = {}
          else if (info.value) info.value = ''
        })
      }
      if (result.status === 'error') {
        this.$refs.form.refs.Account.applyResult({
          errors: [`${result.content}`],
          valid: false,
          failedRules: {}
        })
      }
      if (result.content === '帳號或密碼錯誤') {
        this.$refs.form.refs.Password.applyResult({
          errors: [`${result.content}`],
          valid: false,
          failedRules: {}
        })
      }
    }
  }
}
</script>

<style lang='scss'>
.loginFrom {
  width: 50%;
  height: calc(100% - 10px);
  background-color: $white;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  transition: left .5s;
  border-radius: 20px 20px 20px 20px;
  &.mode{
    left: 50%;
  }
  >form{
    width: 100%;
    height: 100%;
    position: relative;
  }
  .select_mode {
    display: none;
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 1;
  }
  .form_field {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
    padding: 0 10%;
    >div {
      width: 250px;
    }
  }
  @include media(1023px){
    width: 100%;
    &.mode{
      left: auto;
    }
    .form_field{
      margin-top: 0;
    }
    .select_mode {
      @include switchBtn;
    }
  }
  @include media(479px){
    height: 100%;
    border-radius: 0;
    .select_mode{
      top: 10px;
      right: 5px;
    }
  }
}
</style>
