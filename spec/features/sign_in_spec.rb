require "rails_helper"

describe "Sign In" do
  before { visit root_path }

  describe "When exists user" do
    before do
      create :user, email: "test@example.com", password: "12345678"
    end

    scenario "Signing in with correct email password" do
      within(".site-header") do
        fill_in id: "user_email", with: "test@example.com"
        fill_in id: "user_password", with: "12345678"

        click_button "Login / Register"
      end

      expect(page).to have_content "Signed in successfully."
    end

    scenario "Signing in with correct email password" do
      within(".site-header") do
        fill_in id: "user_email", with: "test@example.com"
        fill_in id: "user_password", with: "password_incorrect"

        click_button "Login / Register"
      end

      expect(page).to have_content "Invalid Email or password."
    end
  end

  describe "When user first time sign in by email password" do
    scenario "Signing up with correct email password" do
      within(".site-header") do
        fill_in id: "user_email", with: "test@example.com"
        fill_in id: "user_password", with: "12345678"

        click_button "Login / Register"
      end

      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "Signing up with correct password too short" do
      within(".site-header") do
        fill_in id: "user_email", with: "test@example.com"
        fill_in id: "user_password", with: "pass"

        click_button "Login / Register"
      end

      expect(page).to have_content "Validation failed: Password is too short (minimum is 8 characters)"
    end
  end
end
