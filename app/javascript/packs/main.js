import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue';
import VueRouter from 'vue-router';
import App from '../app.vue';
import GameList from './components/GameList'
import GameItem from './components/GameItem'
import Welcome from './components/Welcome';
import ConsoleList from './components/ConsoleList';
import ConsoleItem from './components/ConsoleItem';

Vue.use(TurbolinksAdapter);
Vue.use(VueRouter);

const routes = [
	{ path: '/', component: Welcome },
	{ path: '/games/:id', component: GameItem },
	{ path: '/games', component: GameList },
	{ path: '/consoles', component: ConsoleList },
	{ path: '/consoles/:id', component: ConsoleItem }
];

const router = new VueRouter({
	base: __dirname,
	routes
});

document.addEventListener('turbolinks:load', () => {
  new Vue({
	router,
    el: '#main',
    render: h => h(App)
  })
})
