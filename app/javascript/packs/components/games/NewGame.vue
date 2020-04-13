<template>
	<div>
		<h2>New Game Information</h2>
		<GameForm @game-success="reroute"/>
		<router-link to="/games" class="nav-link">Cancel</router-link>
	</div>
</template>

<script>
import { newGame } from '../../api/games';
import GameForm from './GameForm';

export default {
	components: {
		GameForm
	},
	methods: {
		reroute(newGame) {
			this.$router.push({ name: 'games-list', params: { message: `${newGame.title} successfully added!`} });
		}
	}
}
</script>

<style scoped>

</style>