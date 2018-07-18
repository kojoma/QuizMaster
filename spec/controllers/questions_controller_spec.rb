require 'rails_helper'

describe QuestionsController do
  describe 'GET#index' do
    let(:questions) { create_list(:question, 5) }
    before { get :index, params: {}, session: {} }

    it 'has a status code 200'do
      expect(response).to have_http_status(:ok)
    end

    it 'renders :index template' do
      expect(response).to render_template :index
    end

    it 'assigns all questions to @questions'do
      expect(assigns(:questions)).to match_array questions
    end
  end

  describe 'GET#show' do
    let(:question) { create(:question) }
    before { get :show, params: {id: question.id}, session: {} }

    it 'has a status code 200'do
      expect(response).to have_http_status(:ok)
    end

    it 'renders :show template' do
      expect(response).to render_template :show
    end

    it 'assigns question to @question'do
      expect(assigns(:question)).to eq question
    end
  end

  describe 'GET#new' do
    before { get :new, params: {}, session: {} }

    it 'has a status code 200'do
      expect(response).to have_http_status(:ok)
    end

    it 'renders :show template' do
      expect(response).to render_template :new
    end

    it 'assigns question to @question'do
      expect(assigns(:question)).to be_a_new Question
    end
  end

  describe 'GET#edit' do
    let(:question) { create(:question) }
    before { get :edit, params: {id: question.id}, session: {} }

    it 'has a status code 200'do
      expect(response).to have_http_status(:ok)
    end

    it 'renders :edit template' do
      expect(response).to render_template :edit
    end

    it 'assigns question to @question'do
      expect(assigns(:question)).to eq question
    end
  end

  describe 'POST#create' do
    let(:create_attributes) do
      {
        content_html: 'question content_html',
        answer_attributes: {
          content: 'answer content'
        }
      }
    end

    it 'save new question and answer' do
      expect do
        post :create, params: { question: create_attributes }, session: {}
      end.to change(Question, :count).by(1).and change(Answer, :count).by(1)
    end

    it 'redirect to :show template' do
      post :create, params: { question: create_attributes }, session: {}
      question = Question.last
      expect(response).to redirect_to(question_path(question))
    end

    it 'render to :new template with invalid params' do
      post :create, params: {
        question: {
          content_html: '',
          answer_attributes: { content: create_attributes[:answer_attributes][:content] }
        }
      }, session: {}
      question = Question.last
      expect(response).to render_template :new
    end

    it 'message should be include in flash[:success]' do
      post :create, params: { question: create_attributes }, session: {}
      expect(flash[:success]).to eq 'Question was successfully created.'
    end
  end

  describe 'PUT#update' do
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }
    let(:update_attributes) do
      {
        content_html: 'updated question content_html',
        answer_attributes: {
          question_id: question.id,
          content: 'updated answer content'
        }
      }
    end

    it 'save updated question and answer' do
      expect do
        put :update, params: { id: question.id, question: update_attributes }, session: {}
      end.to change(Question, :count).by(0).and change(Answer, :count).by(0)
    end

    it 'updates updated question and answer' do
      put :update, params: { id: question.id, question: update_attributes }, session: {}
      question.reload
      expect(question.content_html).to eq update_attributes[:content_html]
      expect(question.answer.question_id).to eq question.id
      expect(question.answer.content).to eq update_attributes[:answer_attributes][:content]
    end

    it 'redirect to :show template' do
      put :update, params: { id: question.id, question: update_attributes }, session: {}
      question = Question.last
      expect(response).to redirect_to(question_path(question))
    end

    it 'render to :edit template with invalid params' do
      put :update, params: {
        id: question.id,
        question: {
          content_html: '',
          answer_attributes: {
            question_id: question.id,
            content: 'updated answer content'
          }
        }
      }, session: {}
      question = Question.last
      expect(response).to render_template :edit
    end

    it 'message should be include in flash[:success]' do
      put :update, params: { id: question.id, question: update_attributes }, session: {}
      expect(flash[:success]).to eq 'Question was successfully updated.'
    end
  end

  describe 'DELETE#destroy' do
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }

    it 'delete question and answer' do
      expect do
        delete :destroy, params: { id: question.id }, session: {}
      end.to change(Question, :count).by(-1).and change(Answer, :count).by(-1)
    end

    it 'redirect to :index template' do
      delete :destroy, params: { id: question.id }, session: {}
      expect(response).to redirect_to(questions_path)
    end

    it 'message should be include in flash[:success]' do
      delete :destroy, params: { id: question.id }, session: {}
      expect(flash[:success]).to eq 'Question was successfully destroyed.'
    end
  end
end
