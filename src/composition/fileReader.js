export default () => {
  const reader = new FileReader()
  const changeFile = (e) => {
    let targetFile = e.target.files[0]
    if (targetFile) {
      if (targetFile.size >= 2097152) {
        alert('檔案太大，請小於2MB')
      } else {
        reader.fileName = targetFile.name
        reader.fileType = targetFile.type
        reader.readAsDataURL(targetFile)
      }
    }
  }
  return {
    reader,
    changeFile
  }
}
