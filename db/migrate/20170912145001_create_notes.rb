class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :video_id

      t.timestamps
    end
  end
end
