require 'rails_helper'

RSpec.feature "Creating Articles" do
    
    before do
        @john = User.create!(email: "john@example.com", password: "password")
        login_as(@john)
    end
    scenario "A user creates a new article" do
        visit "/"
        click_link "New Article"
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur."
        click_button "Create Article"
        # assertions
        expect(page).to have_content("Article has been created")
        expect(page.current_path).to eq(articles_path)
        expect(page).to have_content("Created by: #{@john.email}")
    end
end