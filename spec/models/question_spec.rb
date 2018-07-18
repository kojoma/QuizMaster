require 'rails_helper'

describe Question do
  describe 'validates' do
    it "is invalid without content_html" do
      invalid_question = build(:question, content_html: nil)
      expect(invalid_question).to be_invalid
    end

    it "is invalid include '<script>' in content_html" do
      invalid_question = build(:question, content_html: '<script>')
      expect(invalid_question).to be_invalid
    end

    it "is invalid include '</script>' in content_html" do
      invalid_question = build(:question, content_html: '</script>')
      expect(invalid_question).to be_invalid
    end

    it "is invalid include 'javascript:' in content_html" do
      invalid_question = build(:question, content_html: 'javascript:')
      expect(invalid_question).to be_invalid
    end

    it "is valid with good content_html" do
      valid_question = build(:question)
      expect(valid_question).to be_valid
    end
  end

  describe 'is_correct?' do
    describe 'should return true when answer correct' do
      it "answer = question.answer.content" do
        question = create(:question)
        answer = create(:answer, question_id: question.id)
        question.reload

        expect(question.is_correct?(answer.content)).to be_truthy
      end

      it "answer english = question.answer.content" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '5'})
        question.reload

        expect(question.is_correct?('five')).to be_truthy
      end

      it "answer = question.answer.content english" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: 'five'})
        question.reload

        expect(question.is_correct?('5')).to be_truthy
      end

      it "answer = question.answer.content english sentence" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '5 sentence'})
        question.reload

        expect(question.is_correct?('five sentence')).to be_truthy
      end

      it "answer english = question.answer.content, 2 digit number" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '55'})
        question.reload

        expect(question.is_correct?('fifty-five')).to be_truthy
      end

      it "answer english = question.answer.content, 3 digit number" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '555'})
        question.reload

        expect(question.is_correct?('five hundred and fifty-five')).to be_truthy
      end
    end

    describe 'should return false when answer incorrect' do
      it "answer != question.answer.content" do
        question = create(:question)
        answer = create(:answer, question_id: question.id)
        question.reload

        expect(question.is_correct?(answer.content + 'incorrect')).to be_falsey
      end

      it "answer english != question.answer.content" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '5'})
        question.reload

        expect(question.is_correct?('six')).to be_falsey
      end

      it "answer != question.answer.content english" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: 'five'})
        question.reload

        expect(question.is_correct?('6')).to be_falsey
      end

      it "answer != question.answer.content english sentence" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '5 sentence'})
        question.reload

        expect(question.is_correct?('six sentence')).to be_falsey
      end

      it "answer english = question.answer.content, but to_en out of range" do
        question = create(:question)
        answer = create(:answer, {question_id: question.id, content: '1000'})
        question.reload

        expect(question.is_correct?('one thousand')).to be_falsey
      end
    end
  end
end
