<template>
  <div class="fileComponent">
    <div class="preview">
      <img
        :src="shotUrl ? shotUrl : `${require('@/assets/icon/user.svg')}`"
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
            :ref="name"
            :type="type"
            :name="name"
            @change="changeFile"
          >
        </label>
      </div>
    </div>
  </div>
</template>

<script>
import { computed, onMounted, onBeforeUnmount } from '@vue/composition-api'
import fileReader from '@/composition/fileReader'
export default {
  name: 'FileComponent',
  props: {
    name: {
      type: String,
      required: true
    },
    value: {
      type: Object,
      required: true
    },
    type: {
      type: String,
      required: true
    }
  },
  setup (props, { emit, refs }) {
    const { reader, changeFile } = fileReader()
    const shotUrl = computed({
      get () {
        return props.value.src
      },
      set (val) {
        emit('input', val)
      }
    })
    const fileHandler = (e) => {
      let target = e.target
      let extension = target.fileName.split('.').pop()
      refs.headshot.type = 'text'
      refs.headshot.type = 'file'
      if (extension !== 'jpg' && extension !== 'jpeg' && extension !== 'gif' && extension !== 'png' && extension !== 'svg') {
        alert('請上傳正確檔案格式: (jpg, jpeg, gif, png, svg)')
      } else {
        let type = target.fileType
        let src = target.result
        shotUrl.value = { extension, type, src }
      }
    }
    onMounted(() => {
      reader.addEventListener('load', fileHandler)
    })
    onBeforeUnmount(() => {
      reader.removeEventListener('load', fileHandler)
    })
    return {
      changeFile,
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
      height: 100%;
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
      @include baseBtn(40px, 40px, 50%);
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
        height: 30px;
      }
    }
  }
}
</style>
