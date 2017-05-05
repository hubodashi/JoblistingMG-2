# == Schema Information
#
# Table name: advises
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Advise < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
end
