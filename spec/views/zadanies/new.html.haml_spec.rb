require 'rails_helper'

RSpec.describe "zadanies/new", type: :view do
  before(:each) do
    assign(:zadanie, Zadanie.new(
      :query => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new zadanie form" do
    render

    assert_select "form[action=?][method=?]", zadanies_path, "post" do

      assert_select "input#zadanie_query[name=?]", "zadanie[query]"

      assert_select "textarea#zadanie_content[name=?]", "zadanie[content]"
    end
  end
end
