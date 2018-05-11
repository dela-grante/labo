import Vue from 'vue'
import Router from 'vue-router'
import PensionSimulator from '@/components/PensionSimulator'
import VueTest1 from '@/components/VueTest1'
import CustomComponentTest1 from '@/components/CustomComponentTest1'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'PensionSimulator',
      component: PensionSimulator
    },
    {
      path: '/vue-test1',
      name: 'VueTest1',
      component: VueTest1
    },
    {
      path: '/custom-component-test1',
      name: 'CustomComponentTest1',
      component: CustomComponentTest1
    },
    {
      path: '/pension-simulator',
      name: 'PensionSimulator',
      component: PensionSimulator
    }
  ]
})
