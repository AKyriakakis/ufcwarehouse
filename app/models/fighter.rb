class Fighter < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :age, presence: true
  validates :weightclass, presence: true
end
