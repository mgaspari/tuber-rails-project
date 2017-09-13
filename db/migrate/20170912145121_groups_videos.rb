class GroupsVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :groups_videos do |t|
      t.integer :group_id
      t.integer :video_id
      t.timestamps
    end
  end
end
