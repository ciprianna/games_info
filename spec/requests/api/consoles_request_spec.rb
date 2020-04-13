require "rails_helper"

RSpec.describe "Api::Consoles", type: :request do
	describe "GET /api/consoles" do
		it "returns json with success status" do
			create(:console)
			get "/api/consoles"
			expect(response).to be_successful
			parsed_response = response.parsed_body[0].deep_symbolize_keys
			expect(parsed_response[:name]).to eq("Xbox")
		end
	end

	describe "POST /api/consoles" do
		it "saves a successful record to the database and returns with success status" do
			post "/api/consoles", params: {
				console: {
					name: "Nintendo Switch"
				}
			}
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:name]).to eq("Nintendo Switch")
		end
		it "returns an error message from ActiveRecord if post fails" do
			create(:console)
			post "/api/consoles", params: {
				console: {
					name: "Xbox"
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("has already been taken")
		end
		it "returns an error message from ActiveRecord if data is missing" do
			post "/api/consoles", params: {
				console: {
					fake_field: "Xbox"
				}
			}
			expect(response).not_to be_successful
			parsed_body = response.parsed_body.deep_symbolize_keys
			expect(parsed_body[:errors][0]).to include("can't be blank")
		end
	end

	describe "GET /api/consoles/:id" do
		it "returns json with success status" do
			console = create(:console)
			get "/api/consoles/#{console.id}"
			expect(response).to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:name]).to eq("Xbox")
		end
		it "returns json with error status if console cannot be found" do
			get "/api/consoles/10"
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Console not found")
		end
	end

	describe "PUT /api/consoles/:id" do
		it "returns json with success status" do
			console = create(:console)
			put "/api/consoles/#{console.id}", params: {
				console: {
					name: "Nintendo Switch"
				}
			}
			expect(response).to be_successful
			updated_console = Console.find(console.id)
			expect(updated_console.name).to eq("Nintendo Switch")
		end
		it "returns an error message if body is incorrect" do
			console = create(:console)
			expect{ put "/api/consoles/#{console.id}", params: {
				console: {}
			}}.to raise_error(ActionController::ParameterMissing)
		end
		it "returns json with error status if console cannot be found" do
			put "/api/consoles/10", params: {
				console: {
					name: "Xbox"
				}
			}
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Console not found")
		end
	end

	describe "DELETE /api/consoles/:id" do
		it "returns a success status" do
			console = create(:console)
			delete "/api/consoles/#{console.id}"

			expect(response).to be_successful
			deleted_console = Console.find_by(id: console.id)
			expect(deleted_console).to be_nil
		end
		it "returns json with error status if console cannot be found" do
			delete "/api/consoles/10"
			expect(response).not_to be_successful
			parsed_response = response.parsed_body.deep_symbolize_keys
			expect(parsed_response[:errors][0]).to include("Console not found")
		end
	end
end
