require "rails_helper"

RSpec.describe "GameConsoles", type: :request do
	describe "POST /game_consoles" do
		it "saves a successful record to the database and returns with success status" do
			game = create(:game)
			console = create(:console)
			post "/game_consoles", params: {
				game_consoles: {
					game_id: game.id,
					console_id: console.id
				}
			}
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:game_id]).to eq(game.id)
			expect(parsed_response[:console_id]).to eq(console.id)
		end
		it "returns an error message from ActiveRecord if post fails" do
			game = create(:game)
			console = create(:console)
			game.consoles << console
			post "/game_consoles", params: {
				game_consoles: {
					game_id: game.id,
					console_id: console.id
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("has already been taken")
		end
		it "returns an error message from ActiveRecord if data is missing" do
			game = create(:game)
			post "/game_consoles", params: {
				game_consoles: {
					game_id: game.id
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("must exist")
		end
	end
end
