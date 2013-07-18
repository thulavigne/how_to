require 'spec_helper'

feature 'Deleting steps' do

  let!(:project) { Factory(:project) }
  let!(:step) { Factory(:step, :project => project) }

  before do
    visit '/'
    click_link project.name
    click_link step.title
  end

  scenario "Deleting a step" do
    click_link "Delete Step"
    page.should have_content("This step has been deleted.")
    page.current_url.should == project_url(project)
  end

end
