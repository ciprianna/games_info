<template>
	<div>
		<h2>New Game Information</h2>
		<form @submit="addGame">
			<label for="title">Title</label>
			<input id="title" v-model=title required />
			<label for="release_year">Release Year</label>
			<input id="release_year" v-model=release_year required />
			<label for="image">Image</label>
			<input id="image" v-model=image />
			<label for="description">Description</label>
			<textarea id="description" v-model=description />
			<button>Submit</button>
		</form>
		<router-link to="/games" class="nav-link">Cancel</router-link>
	</div>
</template>

<script>
import { newGame } from '../api/games';

export default {
	data: function () {
		return {
			title: undefined,
			release_year: undefined,
			image: undefined,
			description: undefined
		}
	},

	methods: {
		addGame() {
			newGame({
				title: this.title,
				release_year: this.release_year,
				image: this.image,
				description: this.description
			}).then((response) => {
				console.log("SUCCESS!");
				console.log(response);
			}).catch((error) => {
				console.error(error);
			})
		}
	}
}
</script>

<style scoped>

</style>