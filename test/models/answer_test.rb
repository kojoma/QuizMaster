require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end

  test "validate content" do
    invalid_answer = Answer.new
    refute invalid_answer.valid?

    valid_answer = Answer.new({:question_id => @question.id, :content => 'content'})
    assert valid_answer.valid?
  end
end
