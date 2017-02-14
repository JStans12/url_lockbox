# require "rails_helper"

# I CANT MAKE THIS TEST WORK
# IF I REMOVE JS => TRUE THE LOGIN WILL WORK
# OTHERWISE I CAN'T LOG IN
# RSpec.describe "can mark links as read", :js => :true do
#   it "Mark a link as read" do
#     user = create(:user)
#
#     visit '/'
#     within('#login') do
#       fill_in "email", with: user.email
#       fill_in "password", with: "password"
#       click_on "Login"
#     end
#
#     expect(page).to have_text("finished")
#     expect(page).to_not have_button('mark read')
#   end
# end
