<template>
  <div id="app">
    <p>{{ message }}</p>
	<GameInfo />
  </div>
</template>

<script>
import GameInfo from './packs/components/GameItem'
export default {
	components: { GameInfo },
	data: function () {
		return {
			message: "Game Listing!"
		}
	}
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
