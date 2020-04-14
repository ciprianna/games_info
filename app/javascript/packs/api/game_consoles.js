import axios from "axios";

export const addConsoles = async ({ game_id, console_ids }) => {
	const response = await axios.put(`http://localhost:3000/api/games/${game_id}/console_assocations`, { game_consoles: console_ids });
	return response.data;
}