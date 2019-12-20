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
      let file = e.target.files[0]
      if (file) {
        reader.readAsDataURL(file)
      }
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
.fileComponent {
  width: 250px;
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
      width: 100%;
      object-fit: cover;
      border-radius: 50%;
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
    .preview{
      min-width: 60px;
      min-height: 60px;
    }
    .headshot {
      label {
        width: 30px;
      }
    }
  }
}
</style>
