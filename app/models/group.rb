class Group <  ActiveRecord::Base
  belongs_to :user
  has_many :groups_videos
  has_many :videos, through: :groups_videos
  has_many :notes, through: :videos
  has_many :videos_terms, through: :videos
  has_many :terms, through: :videos_terms
end
