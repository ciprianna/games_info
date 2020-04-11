<template>
	<div>
		<h2 class="game-info">{{message}}</h2>
		<ul>
			<li v-for="game in games" :key="game.id">
				{{game.title}}, {{game.release_year}}
			</li>
		</ul>
	</div>
</template>

<script>
import axios from "axios";

export default {
	data: function () {
		return {
			message: "Game Listing!",
			games: []
		}
	},

	created() {
		axios.get('http://localhost:3000/api/games').then(response => {
			this.games = response.data;
		}).catch(e => console.log(e));
	}
}
</script>

<style scoped>
.game-info {
	color: green
}
</style>