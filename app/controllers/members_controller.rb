class MembersController < ApplicationController
  before_action :find_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def show
    total_games = @member.participants.count
    won = @member.results_count('won')
    loss = @member.results_count('loss')
    average = @member.average_score
    highest = @member.highest_score

    @member_stats = {
      total_games: total_games,
      won: won,
      loss: loss,
      average: average,
      highest: highest 
    }
  end
  
  def edit; end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: 'Member created successfully'
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @member.destroy
      redirect_to members_path, notice: 'Member deleted successfully'
    else
      redirect_to members_path
    end
  end

  private

  def find_member
    @member = Member.find(params[:id])
  end
  
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone_number)
  end
end
