<template>
	<div>
		<h2 class="game-info">Consoles</h2>
		<ul class="console-list">
			<li v-for="console in consoles" :key="console.id">
				<router-link :to="`/consoles/${console.id}`">{{console.name}}</router-link>
			</li>
		</ul>
		<router-link to="/" class="nav-link">Home</router-link>
	</div>
</template>

<script>
import { getConsoles } from '../../api/consoles';

export default {
	data: function () {
		return {
			consoles: [],
			error: undefined
		}
	},

	created() {
		getConsoles().then((response) => {
			this.consoles = response;
		}).catch((error) => {
			this.error = `Uh, oh. Something went wrong fetching games. ${error.message}.`
			console.error(error);
		});
	}
}
</script>

<style scoped>
.console-list {
	text-align: center;
	list-style: none;
	padding-inline-start: 0;
}
</style>