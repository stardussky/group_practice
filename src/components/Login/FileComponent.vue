<template>
  <div class="fileComponent">
    <div class="preview">
      <img
        :src="shotUrl"
        alt="user"
      >
      <div class="headshot">
        <label>
          <img
            src="@/assets/icon/photo.svg"
            alt="upload"
            width="20"
          >
          <input
            :type="type"
            :name="name"
            @change="changeShot"
          >
        </label>
      </div>
    </div>
  </div>
</template>

<script>
import { computed, onMounted, onUnmounted } from '@vue/composition-api'
const reader = new FileReader()
export default {
  name: 'FileComponent',
  props: {
    name: {
      type: String,
      required: true
    },
    value: {
      type: String,
      required: true
    },
    type: {
      type: String,
      required: true
    }
  },
  setup (props, { emit }) {
    const changeShot = (e) => {
      reader.readAsDataURL(e.target.files[0])
    }
    const shotUrl = computed({
      get () {
        return props.value
      },
      set (val) {
        emit('input', val)
      }
    })
    const fileHandler = (e) => {
      shotUrl.value = e.target.result
    }
    onMounted(() => {
      reader.addEventListener('load', fileHandler)
    })
    onUnmounted(() => {
      reader.removeEventListener('load', fileHandler)
    })
    return {
      changeShot,
      shotUrl
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_formButton';
.fileComponent {
  width: 250px;
  margin: auto;
  .preview {
    width: 10vw;
    max-width: 100px;
    min-width: 80px;
    height: 10vw;
    max-height: 100px;
    min-height: 80px;
    background-color: $dark;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    position: relative;
    margin-bottom: 10px;
    >img {
      width: 70%;
      object-fit: cover;
    }
  }
  .headshot {
    position: absolute;
    bottom: 0;
    right: 0;
    z-index: 1;
    input {
      position: fixed;
      opacity: 0;
      visibility: hidden;
    }
    label {
      display: inline-flex;
      @include baseBtn(40px);
      justify-content: center;
      align-items: center;
    }
  }
  @include media(479px){
    width: 100%;
  }
}
</style>
