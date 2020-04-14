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
FactoryBot.define do
  factory :game_console do
    game nil
    console nil
  end
end
