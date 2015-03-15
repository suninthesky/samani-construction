module ProjectsHelper
  def background_image(project)
    {:style => "background-image:url('http://res.cloudinary.com/hogs8ujud/image/upload/#{project.photo.path}');"}
  end
end
