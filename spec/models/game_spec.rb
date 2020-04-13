# == Schema Information
#
# Table name: games
#
#  id           :bigint           not null, primary key
#  description  :text
#  image        :string
#  release_year :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_games_on_release_year  (release_year)
#  index_games_on_title         (title)
#
require "rails_helper"

RSpec.describe Game, type: :model do
	subject { create(:game) }

	describe "title" do
		it "saves correctly" do
			expect(subject).to be_valid
		end

		it "must exist" do
			subject.title = nil
			expect(subject).not_to be_valid
			expect(subject.errors[:title]).to include("can't be blank")
		end

		it "cannot be duplicate" do
			duplicate = Game.new(title: subject.title, release_year: subject.release_year)
			expect(duplicate).not_to be_valid
			expect(duplicate.errors[:title]).to include("has already been taken")
		end

		it "cannot be duplicate case-insensitive" do
			duplicate = Game.new(title: subject.title.upcase, release_year: subject.release_year)
			expect(duplicate).not_to be_valid
			expect(duplicate.errors[:title]).to include("has already been taken")
		end
	end

	describe "image" do
		it "saves correctly" do
			expect(subject).to be_valid
			expect(subject[:image]).to eq("image.link")
		end
		it "can be nil" do
			subject.image = nil
			subject.save
			expect(subject).to be_valid
			expect(subject[:image]).to be_nil
		end
	end

	describe "description" do
		it "saves correctly" do
			expect(subject).to be_valid
			expect(subject[:description]).to eq("Mario Brothers Description")
		end
		it "can be nil" do
			subject.description = nil
			subject.save
			expect(subject).to be_valid
			expect(subject[:description]).to be_nil
		end
	end
end
