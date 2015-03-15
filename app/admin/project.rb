ActiveAdmin.register Project do

  config.sort_order = 'name_asc'

  permit_params :name, :slug, :details, :complete, :featured, :architect_id, :photo, service_ids: []

  controller do
    def find_resource
      Project.where(slug: params[:id]).first!
    end
  end

  filter :name
  filter :architect
  filter :complete
  filter :featured
  filter :services

  index do
    column :name do |project|
      link_to project.name, [:admin, project]
    end
    column :details
    column :photo do |project|
      link_to 'Link to photo', "http://res.cloudinary.com/hogs8ujud/image/upload/#{project.photo.path}", target: "_blank"
    end
    column "Architect" do |project|
      if project.architect
        link_to project.architect.name, [:admin, project.architect]
      end
    end
    column :complete
    column :featured
    column "Services" do |project|
      project.services.each do |s|
        li s.name
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, required: true
      f.input :details, required: true
      f.input :architect, required: true
      f.input :photo, as: :formtastic_attachinary
      f.input :services, as: :check_boxes, collection: Service.all
      f.input :complete
      f.input :featured
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :details
      row :photo do |project|
        link_to 'Link to photo', "http://res.cloudinary.com/hogs8ujud/image/upload/#{project.photo.path}", target: "_blank"
      end
      row :architect
      row "Services" do |project|
        project.services.each do |s|
          li s.name
        end
      end
      row :complete
      row :featured
    end
  end

end
