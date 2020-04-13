<template>
	<form @submit="onSubmit">
		<div class="form-group">
			<label for="title">Title</label>
			<div class="input-side">
				<input id="title" v-model=title required />
				<p class="error-text" v-if="errors">{{relatedError("title")}}</p>
			</div>
		</div>
		<div class="form-group">
			<label for="release_year">Release Year</label>
			<div class="input-side">
				<input id="release_year" class="error" v-model=release_year type="year" required />
				<p class="error-text" v-if="errors">{{relatedError("release_year")}}</p>
			</div>
		</div>
		<div class="form-group">
			<label for="image">Image</label>
			<div class="input-side">
				<input id="image" v-model=image />
				<p class="error-text" v-if="errors">{{relatedError("image")}}</p>
			</div>
		</div>
		<div class="form-group">
			<label for="description">Description</label>
			<div class="input-side">
				<textarea id="description" v-model=description />
				<p class="error-text" v-if="errors">{{relatedError("description")}}</p>
			</div>
		</div>
		<button>Submit</button>
	</form>
</template>

<script>
import { newGame, updateGame } from '../../api/games';

export default {
	data: function () {
		return {
			title: this.$props?.game?.title,
			release_year: this.$props?.game?.release_year,
			image: this.$props?.game?.image,
			description: this.$props?.game?.description,
			errors: undefined
		}
	},
	props: {
		game: {
			type: Object,
			required: false
		}
	},
	methods: {
		onSubmit(event) {
			event.preventDefault();

			const promise = this.game ? updateGame : newGame;

			promise({
				id: this.$props.game ? this.$props.game.id : undefined,
				title: this.title,
				release_year: this.release_year,
				image: this.image,
				description: this.description
			}).then((response) => {
				this.$emit('game-success', response);
			}).catch((error) => {
				this.errors = error.response.data.errors;
			});
		},
		relatedError(field) {
			return this.errors.find(error => error.toLowerCase().includes(field));
		}
	}
}
</script>

<style scoped>
label {
	flex: 30% 1;
	margin-right: 3rem;
	margin-left: auto;
	text-align: right;
}
input, textarea {
	display: block;
    border-radius: 2px;
    line-height: 1.5rem;
    border-color: #161748;
	border-width: 1px;
	padding-left: 1rem;
	font-size: 1rem;
	width: 100%;
}
.input-side {
	flex: 70% 1;
}
.form-group {
	display: flex;
	justify-content: center;
	margin: 3rem 6rem;
}
</style>