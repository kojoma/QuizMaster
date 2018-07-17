require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "validate content" do
    invalid_question = Question.new
    refute invalid_question.valid?

    valid_question = Question.new({:content => 'content'})
    assert valid_question.valid?
  end
end
