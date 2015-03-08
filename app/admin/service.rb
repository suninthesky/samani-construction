ActiveAdmin.register Service do

  config.sort_order = 'name_asc'

  permit_params :name

  filter :name

  index do
    column "Service", :name, sortable: :name do |service|
      link_to service.name, [:admin, service]
    end
  end

  show do
    attributes_table do
      row :name
    end
  end

end
