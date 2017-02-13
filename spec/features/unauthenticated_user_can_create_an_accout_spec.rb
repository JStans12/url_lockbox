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
    expect(page).to have_content("Log Out jim@example.com")
    expect(User.count).to eq(1)
  end

  it "cant create an account with taken email" do
    user = create(:user)

    visit '/'
    within('#sign-up') do
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      fill_in "password_confirmation", with: "password"
      click_on "Sign Up"
    end
    expect(page).to have_content("email has already been taken")
    expect(User.count).to eq(1)
  end

  it "cant create an account with unmatching passwords" do
    visit '/'
    within('#sign-up') do
      fill_in "email", with: "jim@exapmle.com"
      fill_in "password", with: "password"
      fill_in "password_confirmation", with: "passwordz"
      click_on "Sign Up"
    end
    expect(page).to have_content("passwords don't match")
    expect(User.count).to eq(0)
  end
end
