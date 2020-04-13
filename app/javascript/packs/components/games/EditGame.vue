<template>
	<div>
		<p v-if="error" class="error-text">{{error}}</p>
		<div v-if="game">
			<h2>Edit {{game.title}}</h2>
			<GameForm :game="game" @game-success="reroute"/>
			<button type="button" class="danger-button" @click="deleteGame">Delete Game</button>
			<router-link :to="`/games/${game.id}`" class="nav-link">Cancel</router-link>
		</div>
	</div>
</template>

<script>
import { getGame, deleteGame } from '../../api/games';
import GameForm from './GameForm';

export default {
	components: {
		GameForm
	},
	data: function () {
		return {
			game: undefined,
			error: undefined
		}
	},

	created() {
		getGame(this.$route.params.id).then((response) => {
			this.game = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
		});
	},

	methods: {
		reroute(updatedGame) {
			this.$router.push({ name: 'games-list', params: { message: `${updatedGame.title} successfully updated!`} });
		},
		deleteGame() {
			deleteGame(this.game.id).then(() => {
				this.$router.push({ name: 'games-list', params: { message: "Game successfully deleted!"} });
			}).catch((error) => {
				this.error = error.response.errors.message;
			});
		}
	}
}
</script>

<style scoped>
.inline {
	display: inline;
}
</style>