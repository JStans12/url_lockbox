require "rails_helper"

RSpec.describe "registered user" do
  it "can create links" do
    user = create(:user)

    visit '/'
    within('#login') do
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_on "Login"
    end
    fill_in "title", with: "things"
    fill_in "url", with: "http://stuff.com"
    click_on "Submit"

    expect(page).to have_content("new link created")
    expect(page).to have_content("things")
    expect(page).to have_content("http://stuff.com")
    expect(page).to have_button("mark read")
  end
end

RSpec.describe "registered user" do
  it "cant create links with bad url" do
    user = create(:user)

    visit '/'
    within('#login') do
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_on "Login"
    end
    fill_in "title", with: "things"
    fill_in "url", with: "stuff"
    click_on "Submit"

    expect(page).to have_content("link creation failed")
    expect(page).to_not have_content("things")
    expect(page).to_not have_content("stuff")
    expect(page).to_not have_button("mark read")
  end
end
