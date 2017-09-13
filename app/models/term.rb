class Term <  ActiveRecord::Base
  has_many :videos_terms
  has_many :videos, through: :videos_terms
end
