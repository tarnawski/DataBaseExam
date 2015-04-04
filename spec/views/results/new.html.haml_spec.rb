require 'rails_helper'

RSpec.describe "results/new", type: :view do
  before(:each) do
    assign(:result, Result.new(
      :student_id => 1,
      :test_id => 1,
      :points => 1,
      :mark => 1.5
    ))
  end

  it "renders new result form" do
    render

    assert_select "form[action=?][method=?]", results_path, "post" do

      assert_select "input#result_student_id[name=?]", "result[student_id]"

      assert_select "input#result_test_id[name=?]", "result[test_id]"

      assert_select "input#result_points[name=?]", "result[points]"

      assert_select "input#result_mark[name=?]", "result[mark]"
    end
  end
end
