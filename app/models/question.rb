class Question < ApplicationRecord
  has_one :answer, dependent: :destroy
  accepts_nested_attributes_for :answer

  validates :content_html, presence: true
  validates :content_html, format: { without: /<script>/ }
  validates :content_html, format: { without: /<\/script>/ }
  validates :content_html, format: { without: /javascript:/ }

  validates_associated :answer

  CONTENT_HTML_TRUNCATE_LENGTH = 50

  def is_correct?(answer)
    normalize!(self.answer.content) == normalize!(answer)
  end

  private
    def normalize!(str)
      str_array = str.downcase.strip.squish.split(' ')
      str_array.each_with_index do |value, index|
        humanized = value.humanize
        str_array[index] = Utils::IntegerToEn.to_en!(humanized.to_i) if is_integer?(humanized)
      end
      str_array.join(' ')
    end

    def is_integer?(str)
      str =~ /\A[1-9][0-9]*\z/
    end
end
