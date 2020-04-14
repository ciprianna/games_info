# frozen_string_literal: true

class Api::GamesController < ApiController
	def index
		@games = Game.order(title: :asc)
		render json: @games
	end

	def create
		@game = Game.new(game_params)

		if @game.save
			render json: @game, status: :created
		else
			render json: { errors: @game.errors.full_messages }, status: :bad_request
		end
	end

	def show
		@game = Game.includes(:consoles).order("consoles.name").find_by(id: params[:id])

		if @game
			render json: @game
		else
			render json: { errors: ["Game not found"] }, status: :not_found
		end
	end

	def update
		@game = Game.find_by(id: params[:id])

		if @game.nil?
			render json: { errors: ["Game not found"] }, status: :not_found
		else
			@game.update(game_params)
			render json: @game
		end
	end

	def console_assocations
		@game = Game.find_by(id: params[:id])

		if @game.nil?
			render json: { errors: ["Game not found"] }, status: :not_found
		else
			consoles = Console.where(id: params[:game_consoles])
			@game.consoles = consoles
			render json: @game
		end
	end

	def destroy
		@game = Game.find_by(id: params[:id])

		if @game.nil?
			render json: { errors: ["Game not found"] }, status: :not_found
		else
			@game.destroy
			render json: {}, status: :no_content
		end
	end

	private

	def game_params
		params.require(:game).permit(:title, :release_year, :image, :description, :game_consoles)
	end
end
