class QuizController < ApplicationController
  def question
    @question = Question.all.sample(1).first
  end

  def answer
    quiz = Logics::QuizScore.new(quiz_params[:question_id])

    respond_to do |format|
      if quiz.is_correct?(quiz_params[:answer])
        format.html { redirect_to quiz_url, notice: 'Correct' }
      else
        format.html { redirect_to quiz_url, notice: 'Incorrect' }
      end
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question_id, :answer)
    end
end
