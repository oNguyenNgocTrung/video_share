require "rails_helper"

describe "Homepage" do
  before { visit root_path }

  describe "Header" do
    it "has logo brand" do
      header = page.find(".site-header")

      expect(header).to have_content "VideoShare"
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
