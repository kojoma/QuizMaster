class Question < ApplicationRecord
  has_one :answer, dependent: :destroy
  accepts_nested_attributes_for :answer

  validates :content, presence: true
  validates :content, format: { without: /<script>/ }
  validates :content, format: { without: /<\/script>/ }
  validates :content, format: { without: /javascript:/ }

  validates_associated :answer
end
