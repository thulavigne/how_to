require 'spec_helper'

feature "Editing steps" do

  let!(:project) { Factory(:project) }
  let!(:step) { Factory(:step, :project => project) }

  before do
    visit '/'
    click_link project.name
    click_link step.title
    click_link "Edit Step"
  end

  scenario "Updating a step" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Step"
    page.should have_content "This step has been updated."
    within("#step h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content step.title
  end

  scenario "Updating a step with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Step"
    page.should have_content("This step has not been updated.")
  end

end
