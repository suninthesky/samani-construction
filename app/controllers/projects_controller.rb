class ProjectsController < ApplicationController
  before_filter :load_project

  def show
    
  end

  def load_project
    @project = Project.find(params[:id])
  end
end
