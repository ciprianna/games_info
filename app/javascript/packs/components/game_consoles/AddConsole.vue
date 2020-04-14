<template>
	<div>
		<p v-if="message" class="message-text">{{message}}</p>
		<p v-if="error" class="error-text">{{error}}</p>
		<div v-if="game">
			<h2>What other consoles can {{game.title}} be played on?</h2>
			<form @submit=addConsole>
				<div v-for="console in consoles" :key="console.id">
					<input type="checkbox" :id="console.id" :value="console.id" v-model="selectedConsoles" />
					<label :for="console.id">{{console.name}}</label>
				</div>
				<button>Update Consoles</button>
			</form>
			<router-link :to="`/games/${game.id}`" class="nav-link">Cancel</router-link>
		</div>
	</div>
</template>

<script>
import { getGame } from '../../api/games';
import { getConsoles } from '../../api/consoles';
import { addConsoles } from '../../api/game_consoles';

export default {
	data: function () {
		return {
			game: this.$route.params.game,
			consoles: [],
			selectedConsoles: [],
			error: undefined,
			message: undefined
		}
	},

	created() {
		if(!this.game) {
			getGame(this.$route.params.id).then((response) => {
				this.game = response;
				this.game.consoles.forEach((gc) => this.selectedConsoles.push(gc.id));
			}).catch((error) => {
				this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
			});
		}
		getConsoles().then((response) => {
			this.consoles = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
		})
	},

	methods: {
		addConsole() {
			addConsoles({ game_id: this.game.id, console_ids: this.selectedConsoles }).then((response) => {
				this.$router.push({ name: 'show-game', params: { message: `${this.game.title} consoles successfully updated!`} });
			}).catch((error) => {
				this.error = `Uh, oh. Something went wrong. ${error.response.data.errors}.`
			});
		}
	}
}
</script>

<style scoped>

</style>