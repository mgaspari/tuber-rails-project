class GroupsVideo < ActiveRecord::Base
  belongs_to :group
  belongs_to :video
end
