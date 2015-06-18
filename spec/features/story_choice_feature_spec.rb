require 'spec_helper'

# As a user I want to visit the homepage
# choose a story and see the form to fill out
feature "User views the index page" do
  scenario "user sees a list of story titles and clicks one" do
    # content = "Now this is a story all about how my #{noun} got flipped #{verb} upside down. And I\'d like to take a #{time} just sit right down"
    Story.create(name: "Launchers Theme Song", content: "Now this is a story")
    visit '/'
    expect(page).to have_content "Launchers Theme Song"
    click_link "Launchers Theme Song"
    expect(page).to have_content "Unit of time:"
  end
end
