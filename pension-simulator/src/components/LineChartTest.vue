<template>
  <div>
    <el-slider v-model="data1" :min="0" :max="100" />
    <line-chart :chart-data="datacollection">
    </line-chart>
  </div>
</template>

<script>
import LineChart from './LineChart'

export default {
  components: {
    LineChart
  },
  data () {
    return {
      data1: 50,
      datacollection: null
    }
  },
  mounted () {
    this.fillData()
  },
  watch: {
    data1 () {
      console.log('data1 has changed ' + this.data1)
      this.fillData()
      //this.datacollection.datasets[0].data[0] = this.data1
    }
  },
  methods: {
    fillData () {
      this.datacollection = {
        labels: [ 'みなと', 'なつみ', '大輔' ],
        datasets: [
          {
            label: '年齢',
            backgroundColor: '#f87979',
            data: [ this.data1, 23, 37 ]
          }
        ]
      }
    }
  }
}
</script>
