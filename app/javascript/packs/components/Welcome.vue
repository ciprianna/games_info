<template>
	<div>
		<h2>Welcome</h2>
		<img src="../../../assets/images/mario.png" alt="Mario jumping" title="Mario jumping" width="400" height="auto" />
		<p>Let's look at some game info!</p>
		<ul class="pages">
			<li v-for="page in pages" :key="page">
				<router-link :to="`/${page}`">{{capitalize(page)}}</router-link>
			</li>
		</ul>
	</div>
</template>

<script>
import { getGames } from '../api/games';

export default {
	data: function () {
		return {
			pages: [
				"consoles",
				"games"
			]
		}
	},
	methods: {
		capitalize(page) {
			return page[0].toUpperCase() +  page.slice(1); 
		}
	}
}
</script>

<style scoped>
* {
	text-align: center;
}
.pages {
	text-align: center;
	list-style: none;
	padding-inline-start: 0;
}
</style>