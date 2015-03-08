ActiveAdmin.register Architect do

  config.sort_order = 'name_asc'

  permit_params :name, :website

  filter :name

  index do
    column "Architect", :name, sortable: :name do |architect|
      link_to architect.name, [:admin, architect]
    end
    column :website
  end

  show do
    attributes_table do
      row :name
      row :website
    end
  end

end
