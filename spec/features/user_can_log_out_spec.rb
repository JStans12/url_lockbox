require "rails_helper"

RSpec.describe "registered user" do
  it "can login" do
    user = create(:user)
    visit '/'
    within('#login') do
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_on "Login"
    end

    click_on "Log Out #{user.email}"
    expect(page).to have_content("Login or Sign Up")
  end
end
