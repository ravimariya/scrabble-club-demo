class Member < ApplicationRecord
  has_many :participants, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email
  validates :phone_number, presence: true,
                 numericality: true,
                 length: { :maximum => 10 }
  

  def results_count(result)
     participants.where(result: result).count
  end

  def highest_score
    hs_match = participants.order('score desc').first
    return 0 if !hs_match
    game = hs_match.game
    opponent = game.participants.reject{|p| p.id == hs_match.member_id}.last.full_name
    "#{hs_match.score} against #{opponent} on #{game.end_at.strftime("%b %d %Y")}"
  end

  def average_score
    participants.average(:score) || 0
  end

  def top_10_average
    participants.order('score desc').limit(10).average(:score)
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
