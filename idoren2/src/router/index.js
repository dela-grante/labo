import Vue from 'vue'
import Router from 'vue-router'
import IdoRen2 from '@/components/IdoRen2'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'IdoRen2',
      component: IdoRen2
    }
  ]
})
