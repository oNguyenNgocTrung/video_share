class VideoService
  attr_reader :url, :user, :video, :errors

  def initialize url, user
    @url = url
    @video = Video.new user: user, url: url
    @errors = []
  end

  def call
    video.assign_attributes video_info_attributes
    video.save!
    video
  rescue => e
    video.errors.add(:base, e.message)
    video
  end

  private
  def video_info_attributes
    video_info = VideoInfo.new url
    raise "Url is not usable by Youtube" unless video_info.available?
    {
      video_uuid: video_info.video_id,
      provider: "Youtube",
      title: video_info.title,
      description: video_info.description,
      duration: video_info.duration,
      author: video_info.author,
      author_url: video_info.author_url,
      thumbnail_small: video_info.thumbnail_small,
      thumbnail_medium: video_info.thumbnail_medium,
      thumbnail_large: video_info.thumbnail_large,
      embed_url: video_info.embed_url,
      embed_code: video_info.embed_code,
      published_at: video_info.date
    }
  end
end
