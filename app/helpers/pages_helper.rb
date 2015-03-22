module PagesHelper

  def assign_project_class
    if (@projects.where("featured = ?", true).count % 3) == 0
      'uk-width-small-1-3'
    elsif (@projects.where("featured = ?", true).count % 2) == 0
      'uk-width-small-1-2'
    elsif (@projects.where("featured = ?", true).count % 1) == 0
      'uk-width-small-1-1'
    end
  end

  def assign_projects_class
    if (@projects.count % 3) == 0
      'uk-width-small-1-3'
    elsif (@projects.count % 2) == 0
      'uk-width-small-1-2'
    elsif (@projects.count % 1) == 0
      'uk-width-small-1-1'
    end
  end

end
