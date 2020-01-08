export default {
  computed: {
    time () {
      let second = this.clockTime % 60 < 10 ? '0' + this.clockTime % 60 : this.clockTime % 60
      let minute = (this.clockTime - second) / 60 < 10 ? '0' + (this.clockTime - second) / 60 : (this.clockTime - second) / 60
      return `${minute}:${second}`
    }
  }
}
