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
    expect(page).to have_content("Logged in as #{user.email}")
  end

  it "cant login with bad password" do
    user = create(:user)

    visit '/'
    within('#login') do
      fill_in "email", with: user.email
      fill_in "password", with: "passwordz"
      click_on "Login"
    end
    expect(page).to have_content("unsuccessful login attempt")
  end

  it "cant login with bad email" do
    user = create(:user)

    visit '/'
    within('#login') do
      fill_in "email", with: "stuff"
      fill_in "password", with: "passwordz"
      click_on "Login"
    end
    expect(page).to have_content("unsuccessful login attempt")
  end
end
