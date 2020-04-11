import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import GameItem from './components/GameItem'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '#main',
    components: { App }
  })
})
