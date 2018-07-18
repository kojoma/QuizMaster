require 'rails_helper'

describe Logics::QuizScore do
  describe 'is_correct?' do
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }
    let!(:quiz) { Logics::QuizScore.new(question.id) }

    it "should return true when quiz correct" do
      expect(quiz.is_correct?(answer.content)).to be_truthy
    end

    it "should return false when quiz incorrect" do
      expect(quiz.is_correct?(answer.content + 'incorrect')).to be_falsey
    end
  end
end
