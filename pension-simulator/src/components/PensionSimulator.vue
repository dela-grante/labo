<template>
  <div id="body">
      <h1>Pension Simulator 2.0</h1>

      <div id="left">
      <ul>
        <li>
          <label for="fiscal_year">年度</label>
          <input
            id="fiscal_year"
            placeholder="年度"
            v-model.number="fiscal_year">
          <br/>
        </li>

        <li>
          <label for="age">年齢（4月1日時点）</label>
          <input
            id="age"
            placeholder="年齢（4月1日時点）"
            required
            min="20"
            max="60"
            v-model.number="age">
          <br/>
        </li>

        <li>
          <label for="job_grade">ジョブグレード</label>
          <select
            id="job_grade"
            v-model="job_grade">
            <option>I5</option>
            <option>I4</option>
            <option>I3</option>
            <option>I2</option>
            <option>I1</option>
          </select>
          <br/>
        </li>

        <li>
          <label for="balance_db1">2012年3月末日以前分累積</label>
          <input
            id="balance_db1"
            placeholder="2012年3月末日以前分累積"
            v-model.number="balance_db1">
          <br/>
        </li>

        <li>
          <label for="balance_db2">2012年3月末日以降分累積</label>
          <input
            id="balance_db2"
            placeholder="2012年3月末日以降分累積"
            v-model.number="balance_db2">
          <br/>
        </li>

        <li>
          <label for="balance_dc">確定拠出年金（DC）累積</label>
          <input
            id="balance_dc"
            placeholder="確定拠出年金（DC）累積"
            v-model.number="balance_dc">
          <br/>
        </li>

        <li>
          <label for="db_annual_rate_percent">付与利率（実勢金利連動）</label>
          <input
            id="db_annual_rate_percent"
            placeholder="付与利率（実勢金利連動）"
            v-model.number="db_annual_rate_percent">
          <br/>
        </li>

        <li>
          <label for="dc_annual_rate_percent">DC利率</label>
          <input
            id="dc_annual_rate_percent"
            placeholder="DC利率"
            v-model.number="dc_annual_rate_percent">
          <br/>
        </li>
      </ul>
    </div>

    <div id="right">
      <div class="total_balance">
        <span class="title">60歳時点の年金総額</span><br/>
        <span class="amount">{{ balance_at_60 }}</span>
        <span class="unit">円</span>
      </div>
    </div>

    <div id="bottom">
    <line-chart
      :chart-data="datacollection"
      options="options">
    </line-chart>
    <table>
      <!-- <caption>年金シミュレーション結果</caption> -->
      <colgroup span="1" class="normal"></colgroup>
      <colgroup span="1" class="normal"></colgroup>
      <colgroup span="1" class="normal"></colgroup>
      <colgroup span="5" class="db"></colgroup>
      <colgroup span="2" class="dc"></colgroup>
      <colgroup span="1" class="total"></colgroup>
      <thead>
        <tr>
          <th rowspan="3">年齢</th>
          <th rowspan="3">年度</th>
          <th rowspan="3">JG</th>
          <th colspan="5">確定給付年金（DB）</th>
          <th colspan="2">確定拠出年金（DC）</th>
          <th rowspan="3">退職金合計</th>
        </tr>
        <tr>
          <th colspan="2">2012年3月末日以前分</th>
          <th colspan="2">2012年4月1日以降分</th>
          <th rowspan="2">合計</th>
          <th rowspan="2">累積</th>
          <th rowspan="2">前年度利息</th>
        </tr>
        <tr>
          <th>年度末累積退職金額</th>
          <th>前年度利息</th>
          <th>年度末累積退職金額</th>
          <th>前年度利息</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in forecasts2" :key="index">
          <td>{{ item.age }}</td>
          <td>{{ item.fiscal_year }}</td>
          <td>{{ item.job_grade }}</td>
          <td>{{ item.balance_db1 }}</td>
          <td>{{ item.interest_db1 }}</td>
          <td>{{ item.balance_db2 }}</td>
          <td>{{ item.interest_db2 }}</td>
          <td>{{ item.balance_db_total }}</td>
          <td>{{ item.balance_dc }}</td>
          <td>{{ item.interest_dc }}</td>
          <td>{{ item.balance_total }}</td>
        </tr>
      </tbody>
    </table>
    </div>
  </div>
</template>

<script>
import LineChart from './LineChart'

var _ = require('lodash')

export default {
  components: {
    LineChart
  },
  data () {
    return {
      fiscal_year: 2018, // 年度
      age: 36, // 年齢（4月1日時点）
      job_grade: 'I4', // ジョブグレード
      balance_db1: 1600000, // 2012年3月末日以前分累積
      balance_db2: 2400000, // 2012年4月1日以降分累積
      balance_dc: 150000, // 確定拠出年金（DC）累積
      db_annual_rate_percent: 3.0, // 付与利率（実勢金利連動）
      dc_annual_rate_percent: 2.0, // DC利率
      forecasts2: [],
      POINT: {
        DB_AND_DC: {
          I5: { DB: 54, DC: 10.476 },
          I4: { DB: 36, DC: 6.984 },
          I3: { DB: 24, DC: 4.656 },
          I2: { DB: 12, DC: 2.328 },
          I1: { DB: 0, DC: 1.94 }
        },
        DC_ONLY: {
          I5: { DB: 18.9, DC: 45.58 },
          I4: { DB: 12.6, DC: 30.38 },
          I3: { DB: 8.4, DC: 20.26 },
          I2: { DB: 4.2, DC: 10.13 },
          I1: { DB: 3.5, DC: 8.44 }
        }
      }
    }
  },
  watch: {
    forecasts () {
      // Do nothing.
    }
  },
  computed: {
    db_annual_rate () {
      return this.db_annual_rate_percent / 100.0
    },
    dc_annual_rate () {
      return this.dc_annual_rate_percent / 100.0
    },
    balance_at_60 () {
      if (this.forecasts2 && this.forecasts2.length > 0) {
        return this.forecasts2[this.forecasts2.length - 1].balance_total
      } else {
        return null
      }
    },
    forecasts () {
      if (this.age == null) {
        return null
      }
      console.log('Updating forecasts...')

      this.forecasts2 = []

      _.delay(this.calculateNext, 1000, {
        age: this.age,
        fiscal_year: this.fiscal_year - 1,
        job_grade: this.job_grade,
        balance_db1: this.balance_db1,
        interest_db1: 0,
        balance_db2: this.balance_db2,
        interest_db2: 0,
        balance_dc: this.balance_dc,
        interest_dc: 0
      })

      return null
    },
    datacollection () {
      let ret = {
        labels: [],
        datasets: [
          {
            label: 'DB1',
            backgroundColor: '#f87979',
            data: []
          },
          {
            label: 'DB2',
            backgroundColor: '#79f879',
            data: []
          },
          {
            label: 'DC',
            backgroundColor: '#7979f8',
            data: []
          }
        ]
      }

      for (let age = 20; age <= 60; age++) {
        ret.labels.push(age)
        ret.datasets[0].data.push(0)
        ret.datasets[1].data.push(0)
        ret.datasets[2].data.push(0)
      }
      _.forEach(this.forecasts2, v => {
        // ret.labels.push(v.age)
        ret.datasets[0].data[v.age - 20] = v.balance_db1
        ret.datasets[1].data[v.age - 20] = v.balance_db1 + v.balance_db2
        ret.datasets[2].data[v.age - 20] = v.balance_db1 + v.balance_db2 + v.balance_dc
      })
      return ret

      return {
        labels: [ 'みなと', 'なつみ', '大輔' ],
        datasets: [
          {
            label: '年齢',
            backgroundColor: '#f87979',
            data: [ this.age, 0, 0 ]
          }
        ]
      }
    }
  },
  methods: {
    calculateNext (args) {
      this.forecasts2.push({
        age: args.age,
        fiscal_year: args.fiscal_year,
        job_grade: args.job_grade,
        balance_db1: Math.round(args.balance_db1),
        interest_db1: args.interest_db1 ? Math.round(args.interest_db1).toLocaleString() : '−',
        balance_db2: Math.round(args.balance_db2),
        interest_db2: args.interest_db2 ? Math.round(args.interest_db2).toLocaleString() : '−',
        balance_db_total: (Math.round(args.balance_db1) + Math.round(args.balance_db2)).toLocaleString(),
        balance_dc: Math.round(args.balance_dc),
        interest_dc: args.interest_dc ? Math.round(args.interest_dc).toLocaleString() : '−',
        balance_total: (Math.round(args.balance_db1) + Math.round(args.balance_db2) + Math.round(args.balance_dc)).toLocaleString()
      })

      args.age++
      args.fiscal_year++
      // DB1
      args.interest_db1 = Math.floor(args.balance_db1 * this.db_annual_rate)
      args.balance_db1 += args.interest_db1
      // DB2
      // args.interest_db2 = args.balance_db2 * this.db_annual_rate
      // args.balance_db2 = Math.floor(args.balance_db2 +
      //   this.POINT.DB_AND_DC[args.job_grade].DB * 10000 + args.interest_db2)
      args.interest_db2 = Math.floor(args.balance_db2 * this.db_annual_rate)
      args.balance_db2 += this.POINT.DB_AND_DC[args.job_grade].DB * 10000 + args.interest_db2
      // DC
      args.interest_dc = Math.floor(args.balance_dc * this.dc_annual_rate)
      args.balance_dc += this.POINT.DB_AND_DC[args.job_grade].DC * 10000 + args.interest_dc

      if (args.age <= 60) {
        _.delay(this.calculateNext, 0, args)
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1{
  font-size: 80px;
}

#body{
  width: 1200px;
}
#left{
  margin-bottom: 20px;
  width: 500px;
  float: left;
}
#right{
  margin-bottom: 20px;
  width: 700px;
  float: right;
}
#bottom{
  clear: both;
  margin-top: 100px;
}

ul li{
  list-style: none;
}

label{
  margin-right: 10px;
  font-size: 20px;
  width: 300px;
  float: left;
  text-align: right;
}

ul{
  width: 800px;
  margin: 0 auto;
}

input,select{
  width: 200px;
  padding: 0.4em;
  outline: none;
  border: 1px solid #DDD;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  font-size: 20px;
  margin-bottom: 5px;
  float: left;
}
input:focus{
    box-shadow: 0 0 7px #3498db;
    border: 1px solid #3498db;
}
input:required + .help-text::before {
  border-color: red;
  content: '*Required';
}
input:out-of-range + .help-text::before {
    content: 'Out of range';
}
.title{
  font-size: 30px;
}
.amount{
  font-size: 80px;
}
.unit{
  font-size: 40px;
}
table{
  border-collapse:collapse;
  margin:0 auto;
}
td,th{
  padding:10px;
  border: solid 1px #fff;
}
th{
  color:#fff;
  background:#005ab3;
}
table tr:nth-child(odd){
  background:#e6f2ff;
}
</style>
