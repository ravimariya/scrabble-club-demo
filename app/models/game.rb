class Game < ApplicationRecord
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants, allow_destroy: true
  validates :title, :end_at, presence: true
  after_save :set_result

  def set_result
    participants = self.participants.order('score desc')
    participants.first.update(result: 'won')
    participants.last.update(result: 'loss')
  end
end
