# frozen_string_literal: true

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
FactoryBot.define do
	factory :game do
		title "Mario Brothers"
		release_year 1983
	end
end
