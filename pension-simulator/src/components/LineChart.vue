<script>
import { Line, mixins } from 'vue-chartjs'

// export default Bar.extend({
export default {
  mixins: [ Line, mixins.reactiveData ],
//   extends: Line,
  data () {
    return {
      // options: {
      //   scales: {
      //     yAxes: [
      //       {
      //         ticks: {
      //           min: 0,
      //           max: 100
      //         }
      //       }
      //     ]
      //   }
      // }
    }
  },
  props: {
    // Reveal some properties to watch them and update the chart with them.
  },
  mounted () {
    this.chartData = {
      labels: [ 'みなと', 'なつみ', '大輔' ],
      datasets: [
        {
          label: '年齢',
          backgroundColor: '#f87979',
          data: [ 3, 23, 37 ]
        }
      ]

      // datasets: [
      //   {
      //     label: 'みなと',
      //     data: 3
      //   },
      //   {
      //     label: 'なつみ',
      //     data: 23
      //   },
      //   {
      //     label: 'だいすけ',
      //     data: 37
      //   }
      // ]  
    }
    // this.renderChart({
    //   labels: ['36', '37', '38', '39'],
    //   datasets: [
    //     {
    //       label: 'GitHub Commits',
    //       backgroundColor: '#f87979',
    //       data: [40, 20, 12, 39, 10, 40, 39, 70, 40, 20, 12, 11]
    //     }
    //   ]
    // })
  }
}
</script>
