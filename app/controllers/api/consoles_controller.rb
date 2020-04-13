class Api::ConsolesController < ApplicationController
	def index
		@consoles = Console.order(name: :asc)
		render json: @consoles
	end

	def create
		@console = Console.new(console_params)

		if @console.save
			render json: @console, status: :created
		else
			render json: { errors: @console.errors.full_messages }, status: :bad_request
		end
	end

	def show
		@console = Console.find_by(id: params[:id])

		if @console
			render json: @console
		else
			render json: { errors: ["Console not found"] }, status: :not_found
		end
	end

	def update
		@console = Console.find_by(id: params[:id])

		if @console.nil?
			render json: { errors: ["Console not found"] }, status: :not_found
		else
			@console.update(console_params)
			render json: @console, status: :no_content
		end
	end

	def destroy
		@console = Console.find_by(id: params[:id])

		if @console.nil?
			render json: { errors: ["Console not found"] }, status: :not_found
		else
			@console.destroy
			render json: {}, status: :no_content
		end
	end

	private

	def console_params
		params.require(:console).permit(:name)
	end
end
