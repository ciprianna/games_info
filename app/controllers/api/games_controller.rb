# frozen_string_literal: true

class Api::GamesController < ApiController
	def index
		@games = Game.order(title: :asc)
		render json: @games, status: :ok
	end

	def create
		@game = Game.new(game_params)

		if @game.save
			render json: @game, status: :created
		else
			render json: error_response(:bad_request, "Error creating game"), status: :bad_request
		end
	end

	def show
		@game = Game.find(params[:id])

		render json: @game, status: :ok
	end

	def update
		@game = Game.find(params[:id])

		if @game.update(game_params)
			render json: @game, status: :no_content
		else
			render json: error_response(:bad_request, "Update failed for #{@game.name}: #{params[:errors]}"), status: :bad_request
		end
	end

	def destroy
		@game = Game.find(params[:id])

		@game.destroy
		render json: {}, status: :no_content
	end

	private

	def game_params
		params.require(:game).permit(:title, :release_year)
	end

	def error_response(status, message)
		{
			status: status,
			message: message
		}
	end
end
