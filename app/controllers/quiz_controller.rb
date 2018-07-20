class QuizController < ApplicationController
  before_action :set_random_question, only: [:question]
  before_action :set_question, only: [:answer]

  # GET /quiz
  def question
  end

  # POST /quiz
  def answer
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

    def set_random_question
      @question = Question.all.sample(1).first
    end

    def set_question
      @question = Question.find(quiz_params[:question_id])
    end
end
