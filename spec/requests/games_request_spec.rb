require 'rails_helper'

RSpec.describe "Games", type: :request do
	describe "GET /api/games" do
		it "returns json with success status" do
			create(:game)
			get "/api/games"
			expect(response).to be_successful
			parsed_response = response.parsed_body[0].deep_symbolize_keys
			expect(parsed_response[:title]).to eq("Mario Brothers")
			expect(parsed_response[:release_year]).to eq(1983)
		end
	end

	describe "POST /api/games" do
		it "returns json with success status"
		it "returns an error message if body is incorrect"
	end

	describe "GET /api/games/:id" do
		it "returns json with success status" do
			game = create(:game)
			get "/api/games/#{game.id}"
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:title]).to eq("Mario Brothers")
			expect(parsed_response[:release_year]).to eq(1983)
		end
	end

	describe "PUT /api/games/:id" do
		it "returns json with success status"
		it "returns an error message if body is incorrect"
	end

	describe "DELETE /api/games/:id" do
		it "returns a success status"
		it "returns an error message if record cannot be found"
	end
end
