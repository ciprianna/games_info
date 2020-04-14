class GameConsolesController < ApplicationController
	# def new
	# 	@game = Game.new
	# 	@game_console = GameConsole.new({ game_id: @game&.id })
	# end

	def create
		@game_console = GameConsole.new(game_console_params)

		if @game_console.save
			render json: @game_console, status: :created
		else
			render json: { errors: @game_console.errors.full_messages }, status: :bad_request
		end
	end

	# def destroy
	# 	if params[:game_id]
	# 		@game_console = 
	# 	# c.students.find_by(id: 1).destroy
	# 	@game_console = GameConsole.find_by(id: params[:id])

	# 	if @game_console.nil?
	# 		render json: { errors: ["Game-Console association not found"] }, status: :not_found
	# 	else
	# 		@game_console.destroy
	# 		render json: {}, status: :no_content
	# 	end
	# end

	private

	def game_console_params
		params.require(:game_consoles).permit(:id, :game_id, :console_id)
	end
end
