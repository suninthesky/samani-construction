ActiveAdmin.register Project do

  config.sort_order = 'name_asc'

  permit_params :name, :details, :image_url, :complete, :featured, :architect_id, service_ids: []

  filter :name
  filter :architect
  filter :complete
  filter :featured
  filter :services, member_label: :name

  index do
    column :name do |project|
      link_to project.name, [:admin, project]
    end
    column :details
    column :image_url
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
      f.input :image_url
      f.input :architect, required: true
      f.input :services, as: :check_boxes, collection: Service.all, member_label: :name
      f.input :complete
      f.input :featured
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :details
      row :image_url
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
