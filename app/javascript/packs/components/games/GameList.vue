<template>
	<div>
		<p v-if="message" class="notice">{{message}}</p>
		<h2 class="game-info">Games</h2>
		<ul class="games-list">
			<li v-for="game in games" :key="game.id">
				<router-link :to="`/games/${game.id}`">{{game.title}}, {{game.release_year}}</router-link>
			</li>
		</ul>
		<router-link to="/games/new" class="nav-link">Add New Game</router-link>
		<router-link to="/" class="nav-link">Home</router-link>
	</div>
</template>

<script>
import { getGames } from '../../api/games';

export default {
	data: function () {
		return {
			games: [],
			error: undefined,
			message: this.$route.params.message
		}
	},

	created() {
		getGames().then((response) => {
			this.games = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong fetching games. ${error.message}.`
			console.error(error);
		});
	}
}
</script>

<style scoped>
.games-list {
	text-align: center;
	list-style: none;
	padding-inline-start: 0;
}
</style>