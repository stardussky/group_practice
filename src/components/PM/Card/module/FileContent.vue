<template>
  <div class="fileContent">
    <div class="title">
      <img
        src="@/assets/icon/paperclip.svg"
        alt="paperclip"
        width="20"
      >
      <p>附件</p>
    </div>
    <div class="files">
      <ul>
        <li
          v-for="(list, index) in fileContent"
          v-show="list.name"
          :key="list.id"
        >
          <a
            :href="list.src"
            :download="list.name"
          >{{ list.name }}</a>
          <div @click="deleteFile(index)">
            <img
              src="@/assets/icon/delete.svg"
              alt="delete"
            >
            <img
              src="@/assets/icon/delete_on.svg"
              alt="delete"
            >
          </div>
        </li>
      </ul>
      <label :style="{backgroundColor: color}">
        <p>上傳附件</p>
        <input
          ref="fileInput"
          type="file"
          @change="changeFile"
        >
      </label>
    </div>
  </div>
</template>

<script>
import { onMounted, onUnmounted } from '@vue/composition-api'
import fileReader from '@/composition/fileReader'
export default {
  name: 'FileContent',
  props: {
    fileContent: {
      type: Array,
      required: true
    },
    color: {
      type: String,
      required: true
    }
  },
  setup (props, { refs, emit }) {
    const { file, reader, changeFile } = fileReader()
    const fileHandler = (e) => {
      emit('pushFile', {
        id: Math.random() + '',
        name: file.value.name,
        src: e.target.result
      })
      refs.fileInput.type = 'text'
      refs.fileInput.type = 'file'
    }
    const deleteFile = (index) => emit('deleteFile', index)

    onMounted(() => {
      reader.addEventListener('load', fileHandler)
    })
    onUnmounted(() => {
      reader.removeEventListener('load', fileHandler)
    })
    return {
      changeFile,
      deleteFile
    }
  }
}
</script>

<style lang='scss'>
.fileContent {
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 10px;
    }
  }
  .files {
    padding: 5px 0 5px 30px;
    ul{
      color: $dark;
      list-style-position: inside;
      list-style-type: disc;
      @include font(1);
      li {
        position: relative;
        margin-bottom: 5px;
        div{
          @include hoverImg(30px);
          @include positionCenter(y);
          right: 0;
        }
        a {
          color: $dark;
          text-decoration: none;
        }
      }
    }
    >label {
      display: inline-block;
      @include font;
      color: $white;
      border-radius: 5px;
      padding: 5px;
      margin: 10px 0 5px;
      cursor: pointer;
      input {
        position: fixed;
        opacity: 0;
        visibility: hidden;
      }
    }
  }
}
</style>
