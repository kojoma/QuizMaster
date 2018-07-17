require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "validate content html" do
    invalid_question_1 = Question.new
    refute invalid_question_1.valid?

    invalid_question_2 = Question.new({:content_html => '<script>'})
    refute invalid_question_2.valid?

    invalid_question_3 = Question.new({:content_html => '</script>'})
    refute invalid_question_3.valid?

    invalid_question_4 = Question.new({:content_html => 'javascript:'})
    refute invalid_question_4.valid?

    valid_question = Question.new({:content_html => 'content'})
    assert valid_question.valid?
  end
end
