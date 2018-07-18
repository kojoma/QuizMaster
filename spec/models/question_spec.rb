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
    let!(:question) { create(:question) }
    let!(:answer) { create(:answer, question_id: question.id) }
    before { question.reload }

    it "should return true when correct" do
      expect(question.is_correct?(answer.content)).to be_truthy
    end

    it "should return false when incorrect" do
      expect(question.is_correct?(answer.content + 'incorrect')).to be_falsey
    end
  end
end
