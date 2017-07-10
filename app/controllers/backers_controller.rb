class BackersController < ApplicationController
  
  def new
    @project = Project.find(params[:id])
    @rewards = Reward.where(project_id:params[:id])
  end

end
