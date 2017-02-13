require "rails_helper"

RSpec.describe "unauthenticated user" do
  it "can create an account" do
    visit '/'
    within('#sign-up') do
      fill_in "email", with: "jim@example.com"
      fill_in "password", with: "password"
      fill_in "password_confirmation", with: "password"
      click_on "Sign Up"
    end
    expect(page).to have_content("Logged in as jim@example.com")
    expect(User.count).to eq(1)
  end
end
