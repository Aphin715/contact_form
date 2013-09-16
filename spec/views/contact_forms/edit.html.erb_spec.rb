require 'spec_helper'

describe "contact_forms/edit" do
  before(:each) do
    @contact_form = assign(:contact_form, stub_model(ContactForm,
      :email => "MyString",
      :subject => "MyString",
      :description => "MyText",
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit contact_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_form_path(@contact_form), "post" do
      assert_select "input#contact_form_email[name=?]", "contact_form[email]"
      assert_select "input#contact_form_subject[name=?]", "contact_form[subject]"
      assert_select "textarea#contact_form_description[name=?]", "contact_form[description]"
      assert_select "input#contact_form_first_name[name=?]", "contact_form[first_name]"
      assert_select "input#contact_form_last_name[name=?]", "contact_form[last_name]"
    end
  end
end
