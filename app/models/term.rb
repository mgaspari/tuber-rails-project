class Term < ApplicationRecord
  has_many :videos_terms
  has_many :videos, through: :videos_terms
end
