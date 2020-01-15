export default () => {
  const reader = new FileReader()
  const changeFile = (e) => {
    let targetFile = e.target.files[0]
    if (targetFile) {
      reader.fileName = targetFile.name
      reader.fileType = targetFile.type
      reader.readAsDataURL(targetFile)
    }
  }
  return {
    reader,
    changeFile
  }
}
