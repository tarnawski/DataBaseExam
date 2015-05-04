require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :query => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_query[name=?]", "task[query]"

      assert_select "textarea#task_content[name=?]", "task[content]"
    end
  end
end
