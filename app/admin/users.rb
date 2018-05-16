ActiveAdmin.register User do

  permit_params :email, :password, :approve
  
  index do
    selectable_column
    id_column
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
    column :created_at
    column :approved
    actions
    
    actions :defaults => false do |user|
      link_to 'Edit', edit_admin_user_path(user)
      link_to 'Delete', admin_user_path(user), :method => :delete, :confirm => "Are you sure"
      link_to 'View', admin_user_path(user)
      link_to 'Approve', approve_admin_user_path(user), method: :put if !user.approved?
      
    end
    
  end
  
  
  action_item :approve, only: :show do
  link_to 'Approve',  approve_admin_user_path(user), method: :put if !user.approved?
  end
  
  member_action :approve, method: :put do
    user = User.find(params[:id])
    user.update(approved: true)
    redirect_to admin_users_path
  end

end
