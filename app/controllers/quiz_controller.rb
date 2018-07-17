class QuizController < ApplicationController
  def question
    @question = Question.all.sample(1).first
  end

  def answer
    quiz = Logics::QuizScore.new(quiz_params[:question_id])

    respond_to do |format|
      if quiz.is_correct?(quiz_params[:answer])
        flash[:success] = 'Correct'
        format.html { redirect_to quiz_url }
      else
        flash[:alert] = 'Incorrect'
        format.html { redirect_to quiz_url }
      end
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question_id, :answer)
    end
end
