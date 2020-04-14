<template>
	<div>
		<p v-if="message" class="notice">{{message}}</p>
		<div v-if="game">
			<h2>{{game.title}}</h2>
			<p class="subtitle"><i>Released {{game.release_year}}</i></p>
			<img v-if="game.image" :src="game.image" :alt="game.title" width="700" height="auto" />
			<p v-if="game.description" class="description">{{game.description}}</p>
			<router-link :to="{ name: 'edit-game', params: { id: game.id, game: game}}" class="nav-link">Edit Game</router-link>
			<h3 class="consoles">Available to play on these consoles:</h3>
			<ul class="console-list">
				<li v-for="console in game.consoles" :key="console.id">
					<router-link :to="`/consoles/${console.id}`">{{console.name}}</router-link>
				</li>
			</ul>
			<router-link :to="`/games/${game.id}/consoles`" class="nav-link">Add Game To Console</router-link>
			<!-- <a :href="`/game_consoles/new?id=${game.id}`" class="nav-link">Add Game To Console</a> -->
		</div>
		<router-link to="/games" class="nav-link">All Games</router-link>
	</div>
</template>

<script>
import { getGame } from '../../api/games';

export default {
	data: function () {
		return {
			game: undefined,
			allConsoles: [],
			error: undefined,
			message: this.$route.params.message
		}
	},

	created() {
		getGame(this.$route.params.id).then((response) => {
			this.game = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
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
.consoles {
	text-align: center;
}
.console-list {
	text-align: center;
	list-style: none;
	padding-inline-start: 0;
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