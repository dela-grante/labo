/* eslint-disable */

<script>
// import VueCharts from 'vue-chartjs'
import { Bar, mixins } from 'vue-chartjs'

export default {
  mixins: [Bar, mixins.reactiveData],
  data () {
    return {
      options: {
        responsive: false,
        scales: {
          yAxes: [
            {
              ticks: {
                min: 0,
                max: 100
              }
            }
          ]
        }
      }
    }
  },
  props: {
    data1: {
      type: Number,
      required: true
    },
    data2: {
      type: Number,
      required: true
    }
  },
  watch: {
    data1 () {
      this.updateChartData()
    },
    data2 () {
      this.updateChartData()
    }
  },
  methods: {
    updateChartData () {
      const newChartData = Object.assign({}, this.chartData)
      newChartData.datasets[0].data = [this.data1]
      newChartData.datasets[1].data = [this.data2]
      this.chartData = newChartData
    }
  },
  mounted () {
    this.chartData = {
      datasets: [
        {
          label: 'data1',
          data: [this.data1]
        },
        {
          label: 'data2',
          data: [this.data2]
        }
      ]
    }
    this.renderChart(this.chartData, this.options)
  }
}
</script>
