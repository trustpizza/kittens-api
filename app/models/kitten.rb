class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, length: { in: 0..20 }
  validates :cuteness, presence: true, length: { in: 0..10 }
  validates :softness, presence: true, length: { in: 0..10 }
end
