class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :user, index: true
      t.string :video_uuid, null: false
      t.string :provider, null: false
      t.string :title
      t.text :description
      t.integer :duration
      t.string :author
      t.string :author_thumbnail
      t.string :author_url
      t.string :thumbnail_small
      t.string :thumbnail_medium
      t.string :thumbnail_large
      t.string :url, null: false
      t.string :embed_url
      t.string :embed_code
      t.datetime :published_at
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0

      t.timestamps
    end
  end
end
