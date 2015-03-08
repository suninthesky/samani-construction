ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    div style: "float:left; width: 50%; padding: 0 20px; box-sizing: border-box;" do
      section "Recently added projects" do
        table_for Project.order("created_at desc").limit(5) do
          column :name do |project|
            link_to project.name, [:admin, project]
          end
          column :details
        end
      end
    end
    
  end

end
