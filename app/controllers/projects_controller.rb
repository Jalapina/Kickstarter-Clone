class ProjectsController < ApplicationController

  #GET

  def index
    @projects = Project.where(launch:true)
  end

  def learn

  end

  def start

  end

  def new
    @project = Project.find(params[:id])
    session[:project_id] = @project.id
    @story = Story.find_by_project_id(@project.id)
    @user = User.find(session[:id])
    @rewards = Reward.where(project_id:@project.id)
    @count = 1
  end

  def show
    @project = Project.find(params[:id])
  end


  #POST

  def create
    @project = Project.new project_params

    if @project.valid?
      @project.save
      session[:project_id] = @project.id
        @story = Story.create(project_id:@project.id)
          redirect_to "/projects/new/#{@project.id}"
    else
      redirect_to '/projects/start'
    end
  end

  def update
    @project = Project.find(params[:id])
    
    @project.update project_params

    redirect_to :back
  end


  def launch
    @project = Project.find(params[:id])

    @project.update(launch:launch_param)
    session.delete(:project_id)
    redirect_to '/'
  end

  private
    def project_params
      raw = params.require(:project).permit(:title,:category,:location,:residence,:goal,:duration,:blur,:launch,:image)
      project_params = {
        title: raw[:title],
        category: raw[:category],
        residence: raw[:residence],
        goal: raw[:goal],
        duration: raw[:duration],
        blur: raw[:blur],
        location: raw[:location],
        image: raw[:image],
        launch: false
      }
      if session[:id]
        project_params[:user_id] = session[:id]
      end

      return project_params

    end

    def launch_param
      project_params = true
      return project_params
    end
end
