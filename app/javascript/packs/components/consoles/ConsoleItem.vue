<template>
	<div v-if="console">
		<h2>{{console.name}}</h2>
		<p class="subtitle"><i>Here's a list of games for this console</i></p>
		<router-link to="/consoles" class="nav-link">All Consoles</router-link>
	</div>
</template>

<script>
import { getConsole } from '../../api/consoles';

export default {
	data: function () {
		return {
			console: undefined,
			error: undefined
		}
	},

	created() {
		// TODO - redirect if no console with error message
		getConsole(this.$route.params.id).then((response) => {
			this.console = response;
		}).catch((error) => {
			this.error = `Uh, oh. Console could not be found. ${error.message}.`
			console.error(error);
		});
	}
}
</script>

<style scoped>
* {
	text-align: center;
}
</style>