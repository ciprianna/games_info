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
require 'rails_helper'

RSpec.describe Console, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
