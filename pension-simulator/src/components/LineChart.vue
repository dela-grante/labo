<script>
import { Line, mixins } from 'vue-chartjs'

// export default Bar.extend({
export default {
  mixins: [ Line, mixins.reactiveProp ],
//   extends: Line,
  data () {
    return {
    }
  },
  props: [
    'options'
  ],
  watch: {
  },
  methods: {
  },
  mounted () {
    this.renderChart(this.chartData, this.options)
  }
}
</script>
