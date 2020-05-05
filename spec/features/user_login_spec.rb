require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
      @user = User.create!(
        first_name: "Popo",
        last_name: "Popov",
        email: "popo@popo.com",
        password: "123456",
        password_confirmation: "123456"
      )
    end
  
    scenario "They can login" do
      # ACT
      visit "/login"
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_button "Login"
      # DEBUG / VERIFY
      expect(page).to have_content "Signed in as #{@user.first_name}"
      save_screenshot
    end
end
