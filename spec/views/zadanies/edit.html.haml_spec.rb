require 'rails_helper'

RSpec.describe "zadanies/edit", type: :view do
  before(:each) do
    @zadanie = assign(:zadanie, Zadanie.create!(
      :query => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit zadanie form" do
    render

    assert_select "form[action=?][method=?]", zadanie_path(@zadanie), "post" do

      assert_select "input#zadanie_query[name=?]", "zadanie[query]"

      assert_select "textarea#zadanie_content[name=?]", "zadanie[content]"
    end
  end
end
