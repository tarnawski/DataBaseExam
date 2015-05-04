require 'rails_helper'

RSpec.describe "zadanies/index", type: :view do
  before(:each) do
    assign(:zadanies, [
      Zadanie.create!(
        :query => "Query",
        :content => "MyText"
      ),
      Zadanie.create!(
        :query => "Query",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of zadanies" do
    render
    assert_select "tr>td", :text => "Query".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
