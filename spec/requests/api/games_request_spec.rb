require "rails_helper"

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
		it "saves a successful record to the database and returns with success status" do
			post "/api/games", params: {
				game: {
					title: "Mario Brothers",
					release_year: 1983
				}
			}
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:title]).to eq("Mario Brothers")
			expect(parsed_response[:release_year]).to eq(1983)
		end
		it "returns an error message if body is incorrect" do
			create(:game)
			post "/api/games", params: {
				game: {
					title: "Mario Brothers",
					release_year: 1983
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:status]).to include("bad_request")
		end
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
		it "returns json with success status" do
			game = create(:game)
			put "/api/games/#{game.id}", params: {
				game: {
					title: "Mario Brothers II",
					release_year: 1988
				}
			}
			expect(response).to be_successful
			updated_game = Game.find(game.id)
			expect(updated_game.title).to eq("Mario Brothers II")
			expect(updated_game.release_year).to eq(1988)
		end
		it "returns an error message if body is incorrect" do
			game = create(:game)
			expect{ game = put "/api/games/#{game.id}", params: {
				game: {}
			}}.to raise_error(ActionController::ParameterMissing)
		end
	end

	describe "DELETE /api/games/:id" do
		it "returns a success status" do
			game = create(:game)
			delete "/api/games/#{game.id}"

			expect(response).to be_successful
			deleted_game = Game.find_by(id: game.id)
			expect(deleted_game).to be_nil
		end
		it "returns an error message if record cannot be found" do
			create(:game)
			expect{ delete "/api/games/asdf"}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end
end
