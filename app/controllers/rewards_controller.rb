class RewardsController < ApplicationController
  def create
     @reward = Reward.new reward_params

    if @reward.valid?
      @reward.save
      redirect_to :back
    end

  end

  def update
    @reward = Reward.find_by_project_id(params[:id])

    @reward.update reward_params
      @reward.save
      redirect_to :back
  end
  private
    def reward_params
      raw = params.require(:reward).permit(:title,:pledged,:description,:shipping,:limit,:delivery,:project_id)
      reward_params = {
        title: raw[:title],
        pledged: raw[:pledged],
        description: raw[:description],
        shipping: raw[:shipping],
        limit: raw[:limit],
        delivery: raw[:delivery]
      }

      reward_params[:project_id] = session[:project_id]

      return reward_params

    end
end
