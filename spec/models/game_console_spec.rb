# == Schema Information
#
# Table name: game_consoles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  console_id :bigint           not null
#  game_id    :bigint           not null
#
# Indexes
#
#  index_game_consoles_on_console_id  (console_id)
#  index_game_consoles_on_game_id     (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (console_id => consoles.id)
#  fk_rails_...  (game_id => games.id)
#
require "rails_helper"

RSpec.describe GameConsole, type: :model do
	describe "Adding a game to a console" do
		it "correctly associates games to consoles" do
			console = create(:console)
			game = create(:game)
			game.consoles << console
			expect(game.consoles).to eq([console])
		end
		it "correctly associates consoles to games" do
			console = create(:console)
			game = create(:game)
			console.games << game
			expect(console.games).to eq([game])
		end
		it "does not allow games to have duplicate consoles" do
			console = create(:console)
			game = create(:game)
			game.consoles << console
			expect { game.consoles << console }.to raise_exception(
				ActiveRecord::RecordInvalid, "Validation failed: Game has already been taken"
			)
		end
		it "does not allow consoles to have duplicate games" do
			console = create(:console)
			game = create(:game)
			console.games << game
			expect { console.games << game }.to raise_exception(
				ActiveRecord::RecordInvalid, "Validation failed: Game has already been taken"
			)
		end
	end
end
