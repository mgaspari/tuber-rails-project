class VideosTerm < ActiveRecord::Base
  belongs_to :video
  belongs_to :term
end
