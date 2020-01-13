import vueProgressBar from 'vue-progressbar'

const options = {
  color: '#81c7d4',
  failedColor: '#eb7a77',
  thickness: '3px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  location: 'top',
  inverse: false
}
export { vueProgressBar, options }
