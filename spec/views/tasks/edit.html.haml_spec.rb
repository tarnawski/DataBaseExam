require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :query => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_query[name=?]", "task[query]"

      assert_select "textarea#task_content[name=?]", "task[content]"
    end
  end
end
