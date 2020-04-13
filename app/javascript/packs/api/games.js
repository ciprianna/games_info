import axios from "axios";

export const getGames = async () => {
	const response = await axios.get('http://localhost:3000/api/games');
	return response.data;
}

export const getGame = async (id) => {
	const response = await axios.get(`http://localhost:3000/api/games/${id}`);
	return response.data;
}

export const newGame = async ({ title, release_year, image, description }) => {
	const response = await axios.post('http://localhost:3000/api/games', {
		title,
		release_year,
		image,
		description
	});
	return response.data;
}