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
class Console < ApplicationRecord
	has_many :game_consoles
	has_many :games, through: :game_consoles

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
