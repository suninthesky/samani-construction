class PagesController < ApplicationController
  before_filter :all_projects

  def home
  end

  def projects
  end

  def all_projects
    @projects = Project.all
  end
end
