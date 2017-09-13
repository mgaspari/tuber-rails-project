class Video < ApplicationRecord
  has_many :groups_videos
  has_many :groups, through: :groups_videos
  has_many :videos_terms
  has_many :terms, through: :videos_terms
  has_many :notes

end
