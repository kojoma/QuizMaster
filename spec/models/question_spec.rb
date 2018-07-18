require 'rails_helper'

describe Question do
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
