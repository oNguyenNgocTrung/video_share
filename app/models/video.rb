class Video < ApplicationRecord
  belongs_to :user, optional: true

  validates :video_uuid, :provider, :url, presence: true

  scope :latest, -> { order(created_at: :desc) }

  delegate :email, to: :user, allow_nil: true, prefix: true
end
