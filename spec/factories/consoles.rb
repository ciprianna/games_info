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
FactoryBot.define do
  factory :console do
    name "Xbox"
  end
end
