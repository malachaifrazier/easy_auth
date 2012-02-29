require 'spec_helper'

feature 'Authentication' do
  scenario 'with valid attributes' do
    create(:user)
    visit sign_in_path
    fill_in 'Email', :with => 'test@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Submit'

    current_path.should eq dashboard_path
    page.should have_content 'test@example.com'
  end

  scenario 'with invalid attributes' do
    visit sign_in_path
    click_button 'Submit'

    current_path.should eq sign_in_path
  end
end