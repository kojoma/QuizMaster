require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  setup do
    question = questions(:one)
    answer = answers(:one)
    answer.question_id = question.id
    answer.save

    @question = question
  end

  test "should get question" do
    get quiz_url
    assert_response :success
  end

  test "should post answer" do
    post quiz_url, params: { quiz: { question_id: @question.id, answer: 'answer' } }
    assert_redirected_to quiz_url
  end

end
