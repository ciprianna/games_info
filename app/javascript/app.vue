<template>
  <div id="app">
    <h1>
		<router-link to="/" class="home-link">{{ message }}</router-link>
	</h1>
	<router-view></router-view>
  </div>
</template>

<script>
import GameList from './packs/components/GameItem'
export default {
	components: { GameList },
	data: function () {
		return {
			message: "Gamaha"
		}
	}
}
</script>

<style scoped>
a {
	text-decoration: none;
}
p {
	text-align: center;
}
.home-link {
	color:  #f95d9b;
}
</style>
