<template>
  <div>
    <el-slider v-model="data1" :min="0" :max="100" />
    <el-slider v-model="data2" :min="0" :max="100" />
    <el-slider v-model="data3" :min="0" :max="100" />
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
      data2: 50,
      data3: 50
    }
  },
  computed: {
    datacollection () {
      return {
        labels: [ 'みなと', 'なつみ', '大輔' ],
        datasets: [
          {
            label: '年齢',
            backgroundColor: '#f87979',
            data: [ this.data1, this.data2, this.data3 ]
          }
        ]
      }
    }

  },
  methods: {
  }
}
</script>
