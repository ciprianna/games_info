<template>
	<div>
		<p v-if="error" class="error-text">{{error}}</p>
		<div v-if="console">
			<h2>{{console.name}}</h2>
			<p class="subtitle"><i>Here's a list of games for this console</i></p>
			<ul class="games-list">
				<li v-for="game in console.games" :key="game.id">
					<router-link :to="`/games/${game.id}`">{{game.title}}, {{game.release_year}}</router-link>
				</li>
			</ul>
			<router-link to="/consoles" class="nav-link">All Consoles</router-link>
		</div>
	</div>
</template>

<script>
import { getConsole } from '../../api/consoles';

export default {
	data: function () {
		return {
			console: undefined,
			error: undefined
		}
	},

	created() {
		getConsole(this.$route.params.id).then((response) => {
			this.console = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
		});
	}
}
</script>

<style scoped>
* {
	text-align: center;
}
.games-list {
	text-align: center;
	list-style: none;
	padding-inline-start: 0;
}
</style>