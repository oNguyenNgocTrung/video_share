require "rails_helper"

RSpec.describe Video, type: :model do
  it "has a valid factory" do
    expect(build(:video)).to be_valid
  end

  let(:video) { build(:video) }

  describe "ActiveModel validations" do
    it { expect(video).to validate_presence_of(:video_uuid) }
    it { expect(video).to validate_presence_of(:provider) }
    it { expect(video).to validate_presence_of(:url) }
  end

  describe "ActiveRecord associations" do
    it { expect(video).to belong_to(:user) }
  end
end
