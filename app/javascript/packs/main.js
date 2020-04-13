import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue';
import VueRouter from 'vue-router';
import App from '../app.vue';
import Welcome from './components/Welcome';
import { GameList, GameItem, NewGame, EditGame } from './components/games';
import { ConsoleList, ConsoleItem } from './components/consoles';

Vue.use(TurbolinksAdapter);
Vue.use(VueRouter);

const routes = [
	{ path: '/', component: Welcome },
	{ path: '/games/new', component: NewGame },
	{ path: '/games/:id/edit', name: 'edit-game', component: EditGame },
	{ path: '/games/:id', name: 'show-game', component: GameItem },
	{ path: '/games', name: 'games-list', component: GameList },
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
