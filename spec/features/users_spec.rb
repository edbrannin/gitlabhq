require 'spec_helper'

describe 'Users', feature: true do
  describe "GET /users/sign_in" do
    it "should create a new user account" do
      visit new_user_session_path
      fill_in "user_name", with: "Name Surname"
      fill_in "user_username", with: "Great"
      fill_in "user_email", with: "name@mail.com"
      fill_in "user_password_sign_up", with: "password1234"
      expect { click_button "Sign up" }.to change { User.count }.by(1)
    end
  end
end
