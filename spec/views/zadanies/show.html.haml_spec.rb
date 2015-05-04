require 'rails_helper'

RSpec.describe "zadanies/show", type: :view do
  before(:each) do
    @zadanie = assign(:zadanie, Zadanie.create!(
      :query => "Query",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Query/)
    expect(rendered).to match(/MyText/)
  end
end
