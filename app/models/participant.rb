class Participant < ApplicationRecord
  belongs_to :member
  belongs_to :game
  scope :order_by_score, -> { order('score desc') }

  def full_name
    [member.first_name, member.last_name].join(' ')
  end
end
