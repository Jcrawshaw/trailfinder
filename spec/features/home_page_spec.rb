require "rails_helper"

RSpec.feature "Home page", type: :feature do
  scenario "User sees the home page" do
    visit '/'

    expect(page).to have_text("Find a Trail to Run") 

  end

  scenario "User can go to About page" do
    visit '/'
    click 'About'
    #?? expect(page).to have_path("/about")
  end

  # scenario "User can log in" do
  #   user = User.create #... a signed up user
  #   visit '/'
  #   click "Sign In"
  #   # epxec to be on the sign in page
  #   fill_in :username, with: user.name
  #   fill_in :password, with: 'secret'
  #   click 'Log in'
  #   # expect whatever
  # end

  scenario "Logged in User can edit profile " do
    pending
    user = login
    visit '/'
    expect(page).to have_text(user.name)
    click user.name
    #expect(page).to # bethe edit page
  end
end