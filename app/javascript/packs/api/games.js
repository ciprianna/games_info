import axios from "axios";

export const getGames = async () => {
	const response = await axios.get('http://localhost:3000/api/games');
	return response.data;
}

export const getGame = async (id) => {
	const response = await axios.get(`http://localhost:3000/api/games/${id}`);
	return response.data;
}
