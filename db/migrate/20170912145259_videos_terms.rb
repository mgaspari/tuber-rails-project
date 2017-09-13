class VideosTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :videos_terms do |t|
      t.integer :video_id
      t.integer :term_id
      t.float :time
      t.timestamps
    end
  end
end
