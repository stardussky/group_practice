import { ref } from '@vue/composition-api'
export default () => {
  const reader = new FileReader()
  const file = ref(null)
  const changeFile = (e) => {
    let targetFile = e.target.files[0]
    if (targetFile) {
      reader.readAsDataURL(targetFile)
      file.value = targetFile
    }
  }
  return {
    file,
    reader,
    changeFile
  }
}
