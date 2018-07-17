class Question < ApplicationRecord
  has_one :answer, dependent: :destroy
  accepts_nested_attributes_for :answer

  validates :content_html, presence: true
  validates :content_html, format: { without: /<script>/ }
  validates :content_html, format: { without: /<\/script>/ }
  validates :content_html, format: { without: /javascript:/ }

  validates_associated :answer
end
