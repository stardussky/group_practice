export default {
  props: {
    projectId: {
      type: String,
      required: true
    }
  },
  methods: {
    enterPage (page) {
      if (this.projectId !== '' && page === 'ProjectManagement') {
        this.$router.push({ name: 'Project', params: { id: this.projectId } })
      } else {
        this.$router.push({ name: page })
      }
    }
  }
}
