# == Schema Information
#
# Table name: consoles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_consoles_on_name  (name)
#
require "rails_helper"

RSpec.describe Console, type: :model do
	subject { create(:console) }

	describe "name" do
		it "saves correctly" do
			expect(subject).to be_valid
		end

		it "must exist" do
			subject.name = nil
			expect(subject).not_to be_valid
			expect(subject.errors[:name]).to include("can't be blank")
		end

		it "cannot be duplicate" do
			duplicate = Console.new(name: subject.name)
			expect(duplicate).not_to be_valid
			expect(duplicate.errors[:name]).to include("has already been taken")
		end

		it "cannot be duplicate case-insensitive" do
			duplicate = Console.new(name: subject.name)
			expect(duplicate).not_to be_valid
			expect(duplicate.errors[:name]).to include("has already been taken")
		end
	end
end
