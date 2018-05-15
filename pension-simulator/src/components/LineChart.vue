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
  props: {
    // Reveal some properties to watch them and update the chart with them.
  },
  watch: {
  },
  methods: {
  },
  mounted () {
    this.renderChart(this.chartData, {})
  }
}
</script>
