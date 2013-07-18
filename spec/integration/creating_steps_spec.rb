require 'spec_helper'

feature "Creating Steps" do

  before do
    Factory(:project, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Step"
  end

  scenario "Creating a step" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "My pages are ugly!"
    click_button "Create Step"
    page.should have_content("A new step has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("New step has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "it sucks"
    click_button "Create Step"
    page.should have_content("New step has not been created.")
    page.should have_content("Description is too short")
  end

end
