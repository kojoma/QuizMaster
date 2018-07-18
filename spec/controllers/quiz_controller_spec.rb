require 'rails_helper'

describe QuizController do
  describe 'GET#question' do
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }
    before { get :question, params: {}, session: {} }

    it 'has a status code 200'do
      expect(response).to have_http_status(:ok)
    end

    it 'renders :index template' do
      expect(response).to render_template :question
    end

    it 'assigns question to @question'do
      expect(assigns(:question)).to eq question
    end
  end

  describe 'POST#answer' do
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }
    let(:quiz_attributes) do
      {
        question_id: question.id,
        answer: answer.content
      }
    end

    it 'renders :answer template' do
      post :answer, params: { quiz: quiz_attributes }, session: {}
      expect(response).to render_template :answer
    end

    it 'message should be include in flash[:success] with quiz correct' do
      post :answer, params: { quiz: quiz_attributes }, session: {}
      expect(flash[:success]).to eq 'Correct'
      expect(flash[:alert]).to eq nil
    end

    it 'message should be include in flash[:alert] with quiz incorrect' do
      post :answer, params: {
        quiz: {
          question_id: question.id,
          answer: answer.content + 'incorrect'
        }
      }, session: {}
      expect(flash[:alert]).to eq 'Incorrect'
      expect(flash[:success]).to eq nil
    end
  end
end
