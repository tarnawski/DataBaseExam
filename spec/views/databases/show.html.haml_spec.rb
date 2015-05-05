require 'rails_helper'

RSpec.describe "databases/show", type: :view do
  before(:each) do
    @database = assign(:database, Database.create!(
      :name => "Name",
      :comment => "MyText",
      :adapter => "Adapter",
      :encoding => "Encoding",
      :host => "Host",
      :pool => 1,
      :username => "Username",
      :password => "Password",
      :database => "Database",
      :image_path => "Image Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Adapter/)
    expect(rendered).to match(/Encoding/)
    expect(rendered).to match(/Host/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Database/)
    expect(rendered).to match(/Image Path/)
  end
end
