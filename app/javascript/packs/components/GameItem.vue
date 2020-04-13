<template>
	<div v-if="game">
		<h2>{{game.title}}</h2>
		<p class="subtitle"><i>Released {{game.release_year}}</i></p>
		<img :src="game.image" :alt="game.title" width="700" height="auto" />
		<p class="description">{{game.description}}</p>
		<router-link to="/games" class="nav-link">All Games</router-link>
	</div>
</template>

<script>
import { getGame } from '../api/games';

export default {
	data: function () {
		return {
			game: undefined,
			error: undefined
		}
	},

	created() {
		// TODO - redirect if no game
		getGame(this.$route.params.id).then((response) => {
			this.game = response;
		}).catch((error) => {
			this.error = `Uh, oh. Game could not be found. ${error.message}.`
			console.error(error);
		});
	}
}
</script>

<style scoped>
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	max-width: 80%;
}
.subtitle {
	text-align: center;
}
.description {
	margin-top: 3rem;
	margin-left: 3rem;
	margin-right: 3rem;
}
@media (min-width: 780px) {
	.description {
		margin-left: 6rem;
		margin-right: 6rem;
	}
}
@media (min-width: 1210px) {
	.description {
		margin-left: 8rem;
		margin-right: 8rem;
	}
}
</style>