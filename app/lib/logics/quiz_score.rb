class Logics::QuizScore
  def initialize(question_id)
    @question = Question.find(question_id)
  end

  def is_correct?(answer)
    @question.answer.content == answer
  end
end
