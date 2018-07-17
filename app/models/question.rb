class Question < ApplicationRecord
  has_one :answer, dependent: :destroy
  accepts_nested_attributes_for :answer
  validates :content, presence: true
  validates_associated :answer
end
