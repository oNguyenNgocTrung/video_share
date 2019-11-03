require "rails_helper"

describe "Homepage" do
  describe "Header" do
    before { visit root_path }

    subject { page.find(".site-header") }

    it "has logo brand" do
      expect(subject).to have_content "VideoShare"
    end

    scenario "When user is not logged in" do
      expect(subject).to have_field "user_email", type: "email"
      expect(subject).to have_field "user_password", type: "password"
    end

    scenario "When user logged in", logged_in: true do
      expect(subject).to have_content "Welcome, #{user.email}"
      expect(subject).to have_link "Share a video"
      expect(subject).to have_link "Logout"
    end
  end

  describe "Main Page" do
    scenario "visitor can see a list of all shared movies" do
      videos = create_list(:video, 5)
      first_video = videos[0]

      visit root_path

      main_page = page.find("main")

      expect(main_page.all(".card").count).to eq 5
      expect(main_page).to have_content first_video.title
      expect(main_page).to have_content first_video.description
    end
  end

  describe "Footer" do
    before { visit root_path }

    scenario "has footer info" do
      footer = page.find("footer.site-footer")

      expect(footer).to have_content "Copyright © 2019 VideoShare. All rights reserved"
      expect(footer).to have_content "Powered by VideoShare"
    end
  end
end
