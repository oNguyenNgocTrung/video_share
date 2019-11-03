require "rails_helper"

describe "New Video Page" do
  let(:valid_video_info) do
    OpenStruct.new(video_id: "WjXrOLL3ioI", title: "Valid Title", description: "Valid Description", available?: true,
      duration: "", author: "", author_url: "", thumbnail_small: "", thumbnail_medium: "",
      thumbnail_large: "", embed_url: "", embed_code: "", date: nil
    )
  end
  let(:invalid_video_info) { OpenStruct.new(available?: false) }

  before { visit root_path }

  describe "When user logged in" do
    before do
      within(".site-header") do
        fill_in id: "user_email", with: "test@example.com"
        fill_in id: "user_password", with: "12345678"

        click_button "Login / Register"

        visit new_video_path
      end
    end

    scenario "Share video with valid url" do
      allow(VideoInfo).to receive(:new).and_return(valid_video_info)

      within("#new_video") do
        fill_in id: "video_url", with: "https://www.youtube.com/watch?v=WjXrOLL3ioI"

        click_button "Share"
      end

      expect(page).to have_content "Video shared successfully!!!"
      expect(page).to have_content valid_video_info.title
      expect(page).to have_content valid_video_info.description
    end

    scenario "Share video with invalid url" do
      allow(VideoInfo).to receive(:new).and_return(invalid_video_info)

      within("#new_video") do
        fill_in id: "video_url", with: "https://www.youtube.com/watch?v=WjXrOLL3ioI"

        click_button "Share"
      end

      expect(page).to have_content "Video share failed. Please try again!!!"
    end
  end

  describe "When user is not logged in" do
    before { visit new_video_path }

    it { expect(page).to have_content "You need to sign in or sign up before continuing." }
  end
end
