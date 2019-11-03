require "rails_helper"

describe "Homepage" do
  before { visit root_path }

  describe "Header" do
    subject { page.find(".site-header") }

    it "has logo brand" do
      expect(subject).to have_content "VideoShare"
    end

    context "When user is not logged in" do
      it do
        expect(subject).to have_field "user_email", type: "email"
        expect(subject).to have_field "user_password", type: "password"
      end
    end

    context "When user logged in", logged_in: true do
      it do
        expect(subject).to have_content "Welcome, #{user.email}"
        expect(subject).to have_button "Share a video"
        expect(subject).to have_link "Logout"
      end
    end
  end

  describe "Footer" do
    it "has footer info" do
      footer = page.find("footer.site-footer")

      expect(footer).to have_content "Copyright © 2019 VideoShare. All rights reserved"
      expect(footer).to have_content "Powered by VideoShare"
    end
  end
end
