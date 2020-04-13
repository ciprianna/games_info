import axios from "axios";

export const getGames = () => {
	return axios.get('http://localhost:3000/api/games').then(response => {
		return response.data;
	});
}

export const getGame = (id) => {
	return axios.get(`http://localhost:3000/api/games/${id}`).then(response => {
		return response.data;
	});
}
