class Api::ConsolesController < ApplicationController
	def index
		@consoles = Console.order(name: :asc)
		render json: @consoles, status: :ok
	end

	def create
		@console = Console.new(console_params)

		if @console.save
			render json: @console, status: :created
		else
			render json: error_response(:bad_request, "Error creating console"), status: :bad_request
		end
	end

	def show
		@console = Console.find(params[:id])

		render json: @console, status: :ok
	end

	def update
		@console = Console.find(params[:id])

		if @console.update(console_params)
			render json: @console, status: :no_content
		end
	end

	def destroy
		@console = Console.find(params[:id])

		@console.destroy
		render json: {}, status: :no_content
	end

	private

	def console_params
		params.require(:console).permit(:name)
	end

	def error_response(status, message)
		{
			status: status,
			message: message
		}
	end
end
