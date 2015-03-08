ActiveAdmin.register AdminUser do

  config.sort_order = 'email_asc'

  filter :email

  permit_params :email, :password, :password_confirmation

  index do
    column :email do |user|
      link_to user.email, [:admin, user]
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :sign_in_count
      row "Last seen" do |user|
        user.last_sign_in_at
      end
    end
  end

end
