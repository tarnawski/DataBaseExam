require 'rails_helper'

RSpec.describe "results/edit", type: :view do
  before(:each) do
    @result = assign(:result, Result.create!(
      :student_id => 1,
      :test_id => 1,
      :points => 1,
      :mark => 1.5
    ))
  end

  it "renders the edit result form" do
    render

    assert_select "form[action=?][method=?]", result_path(@result), "post" do

      assert_select "input#result_student_id[name=?]", "result[student_id]"

      assert_select "input#result_test_id[name=?]", "result[test_id]"

      assert_select "input#result_points[name=?]", "result[points]"

      assert_select "input#result_mark[name=?]", "result[mark]"
    end
  end
end
