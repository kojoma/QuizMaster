class QuizController < ApplicationController
  # GET /quiz
  def question
    @question = Question.all.sample(1).first
  end

  # POST /quiz
  def answer
    @question = Question.find(quiz_params[:question_id])

    respond_to do |format|
      if @question.is_correct?(quiz_params[:answer])
        flash.now[:success] = 'Correct'
        format.html { render :answer }
      else
        flash.now[:alert] = 'Incorrect'
        format.html { render :answer }
      end
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question_id, :answer)
    end
end
