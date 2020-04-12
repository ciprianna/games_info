<template>
	<div>
		<h2 class="game-info">Games</h2>
		<ul>
			<li v-for="game in games" :key="game.id">
				{{game.title}}, {{game.release_year}}
			</li>
		</ul>
		<h2>One Game</h2>
		<template v-if="singleGame">
			<p>{{singleGame.title}}, released {{singleGame.release_year}}</p>
			<img :src="singleGame.image" :alt="singleGame.title" width="700" height="auto" />
			<p>{{singleGame.description}}</p>
		</template>
		
		<!-- TODO - style error like a flash or add a flash notice to top of page? -->
		<p>{{error}}</p>
	</div>
</template>

<script>
import axios from "axios";

export default {
	data: function () {
		return {
			games: [],
			singleGame: undefined,
			error: undefined
		}
	},

	created() {
		axios.get('http://localhost:3000/api/games').then(response => {
			this.games = response.data;
		}).catch((error, response) => {
			this.error = `Uh, oh. Something went wrong fetching games. ${error.message}.`
			console.error(error);
		});

		axios.get('http://localhost:3000/api/games/5').then(response => {
			this.singleGame = response.data;
		}).catch((error, response) => {
			this.error = `Uh, oh. Game could not be found. ${error.message}.`
			console.error(error);
		});
	}
}
</script>

<style scoped>
.game-info {
	color: green
}
</style>