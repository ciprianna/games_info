class GameConsolesController < ApplicationController
	def create
		@game_console = GameConsole.new(game_console_params)

		if @game_console.save
			render json: @game_console, status: :created
		else
			render json: { errors: @game_console.errors.full_messages }, status: :bad_request
		end
	end

	private

	def game_console_params
		params.require(:game_consoles).permit(:id, :game_id, :console_id)
	end
end
