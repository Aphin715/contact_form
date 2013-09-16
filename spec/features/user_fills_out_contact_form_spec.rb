require 'spec_helper'

feature "Lets site visitor to contact DogHub Staff", %Q{
As a site visitor
I want to contact DogHub staff
So that I can tell them how awesome they are
} do

 # Acceptance Criteria:
  # * I must provide a email address
  # * I must provide a subject
  # * I must provide description
  # * I must provide a first name
  # * I must provide a last name

  context "with valid attributes" do
    let(:contact) {FactoryGirl.build(:contact_form)}
    it "is able to contact the doghub staff with valid attributes" do
      visit '/contact_forms/new'

      fill_in "Email", with: contact.email
      fill_in "Subject", with: contact.subject
      fill_in "Description", with: contact.description
      fill_in "First name", with: contact.first_name
      fill_in "Last name", with: contact.last_name
      click_on "Create Contact form"

      expect(page).to have_content "Contact form was successfully created"
    end
  end
  context "with invalid attributes" do
    it "attempts to contact dog hub without a first name" do
    visit '/contact_forms/new'
    fill_in "Email", with: "acp10@pitt.edu"
    fill_in "Subject", with: "dog help"
    fill_in "Description", with: "I have a dog with problems"
    fill_in "Last name", with: "Phinizy"
    # Notice that we have omitted the step where we fill out location
    click_on "Create Contact form"

    expect(page).to have_content "First name can't be blank"
  end
end

  context "deleting a inquiry" do
    it "deletes an inquiry" do
      destroy = FactoryGirl.create(:contact_form)
      visit '/contact_forms'
      click_on "Destroy"

      expect(page).to_not have_content destroy.email
    end
  end

end

# feature "Lets Admin see all contact inquiries"
# ,%q{As an admin
# I want to review contact inquiries
# So that I can respond or take action
# } do
# end
