import axios from "axios";

export const getConsoles = async () => {
	const response = await axios.get('http://localhost:3000/api/consoles');
	return response.data;
}

export const getConsole = async (id) => {
	const response = await axios.get(`http://localhost:3000/api/consoles/${id}`);
	return response.data;
}
