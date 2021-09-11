class LeaderBoardController < ApplicationController
  def index
    member_ids = Member.joins(:participants).group('members.id').having("count('participants.id')>=10").ids
    @top_10 = []
    Member.find(member_ids).each do |member|
      @top_10 << {
        name: member.full_name,
        average: member.top_10_average
      }
    end
    @top_10
  end
end
