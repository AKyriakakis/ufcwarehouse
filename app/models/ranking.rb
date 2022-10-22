class Ranking < ApplicationRecord
  validates :weightclass, presence: true
  validates_uniqueness_of :weightclass
end