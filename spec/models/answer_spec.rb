require 'rails_helper'

describe Answer do
  it "is invalid without content" do
    invalid_answer = build(:answer, content: nil)
    expect(invalid_answer).to be_invalid
  end

  it "is invalid without question_id" do
    invalid_answer = build(:answer, question_id: nil)
    expect(invalid_answer).to be_invalid
  end

  it "is valid with good content" do
    valid_answer = build(:answer)
    expect(valid_answer).to be_valid
  end
end
