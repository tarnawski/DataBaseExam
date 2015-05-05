require 'rails_helper'

RSpec.describe "databases/edit", type: :view do
  before(:each) do
    @database = assign(:database, Database.create!(
      :name => "MyString",
      :comment => "MyText",
      :adapter => "MyString",
      :encoding => "MyString",
      :host => "MyString",
      :pool => 1,
      :username => "MyString",
      :password => "MyString",
      :database => "MyString",
      :image_path => "MyString"
    ))
  end

  it "renders the edit database form" do
    render

    assert_select "form[action=?][method=?]", database_path(@database), "post" do

      assert_select "input#database_name[name=?]", "database[name]"

      assert_select "textarea#database_comment[name=?]", "database[comment]"

      assert_select "input#database_adapter[name=?]", "database[adapter]"

      assert_select "input#database_encoding[name=?]", "database[encoding]"

      assert_select "input#database_host[name=?]", "database[host]"

      assert_select "input#database_pool[name=?]", "database[pool]"

      assert_select "input#database_username[name=?]", "database[username]"

      assert_select "input#database_password[name=?]", "database[password]"

      assert_select "input#database_database[name=?]", "database[database]"

      assert_select "input#database_image_path[name=?]", "database[image_path]"
    end
  end
end
