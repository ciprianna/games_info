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
		it "returns an error message from ActiveRecord if post fails" do
			create(:game)
			post "/api/games", params: {
				game: {
					title: "Mario Brothers",
					release_year: 1983
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("has already been taken")
		end
		it "returns an error message from ActiveRecord if data is missing" do
			post "/api/games", params: {
				game: {
					release_year: 1983
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("can't be blank")
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
		it "returns json with error status if game cannot be found" do
			get "/api/games/10"
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Game not found")
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
		it "returns json with error status if game cannot be found" do
			put "/api/games/10", params: {
				game: {
					title: "Mario Brothers II",
					release_year: 1988
				}
			}
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Game not found")
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
		it "returns json with error status if game cannot be found" do
			delete "/api/games/10"
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Game not found")
		end
	end

	describe "PUT /api/games/:id/console_associations" do
		it "returns a success status" do
			game = create(:game)
			console1 = create(:console)
			console2 = Console.create(name: "Wii")
			put "/api/games/#{game.id}/console_assocations", params: {
				game_consoles: [console1.id, console2.id]
			}

			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:consoles].first[:id]).to eq(console1.id)
			expect(parsed_response[:consoles].last[:id]).to eq(console2.id)
		end
		it "returns json with error status if game cannot be found" do
			create(:game)
			console1 = create(:console)
			console2 = Console.create(name: "Wii")
			put "/api/games/10/console_assocations", params: {
				game_consoles: [console1.id, console2.id]
			}
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Game not found")
		end
		it "will remove existing associations" do
			game = create(:game)
			console1 = create(:console)
			game.consoles << console1
			expect(game.consoles).to eq([console1])

			console2 = Console.create(name: "Wii")
			put "/api/games/#{game.id}/console_assocations", params: {
				game_consoles: [console2.id]
			}
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:consoles].first[:id]).to eq(console2.id)
			expect(parsed_response[:consoles].count).to eq(1)
		end
	end
end
