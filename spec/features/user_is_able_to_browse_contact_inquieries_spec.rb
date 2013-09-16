require 'spec_helper'
feature "Lets admis review contact inquiries", %Q{As an admin
I want to review contact inquiries
So that I can respond or take action
} do

 context "visit the home page" do
  let(:contact) {FactoryGirl.build(:contact_form)}

  it "shows the filled out form" do
     visit '/contact_forms/new'
      fill_in "Email", with: contact.email
      fill_in "Subject", with: contact.subject
      fill_in "Description", with: contact.description
      fill_in "First name", with: contact.first_name
      fill_in "Last name", with: contact.last_name
      click_on "Create Contact form"
  visit '/contact_forms'
  click_on "Show"
  expect(page).to have_content "Email"

    end
  end
end