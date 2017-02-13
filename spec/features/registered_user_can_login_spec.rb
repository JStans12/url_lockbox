require "rails_helper"

RSpec.describe "registered user" do
  it "can login" do
    user = create(:user)

    visit '/'
    within('#login') do
      fill_in "email", with: "jim@example.com"
      fill_in "password", with: "password"
      click_on "Login"
    end
    expect(page).to have_content("Logged in as #{user.email}")
  end
end
