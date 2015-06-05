require 'rails_helper'

RSpec.describe "databases/index", type: :view do
  before(:each) do
    assign(:databases, [
      Database.create!(
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
      ),
      Database.create!(
        :name => "Name2",
        :comment => "MyText",
        :adapter => "Adapter",
        :encoding => "Encoding",
        :host => "Host",
        :pool => 1,
        :username => "Username",
        :password => "Password",
        :database => "Database",
        :image_path => "Image Path"
      )
    ])
  end

  it "renders a list of databases" do
    render

    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Adapter".to_s, :count => 2
    assert_select "tr>td", :text => "Encoding".to_s, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Database".to_s, :count => 2
    assert_select "tr>td", :text => "Image Path".to_s, :count => 2
  end
end
