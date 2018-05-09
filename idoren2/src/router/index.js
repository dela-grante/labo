import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Inquiry from '@/components/Inquiry'
import Usage from '@/components/Usage'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main
    },
    {
      path: '/inquiry',
      name: 'Inquiry',
      component: Inquiry
    },
    {
      path: '/usage',
      name: 'Usage',
      component: Usage
    }
  ]
})
