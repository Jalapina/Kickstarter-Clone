class StoriesController < ApplicationController
  def update
    @story = Story.find_by_project_id(params[:id])
    @story.update story_params
      @story.save
      redirect_to :back
  end

  private

    def story_params
      params.require(:story).permit(:description, :risk)
    end

end
