ActiveAdmin.register User do

  permit_params :email, :password, :approev
  
  action_item :approve, only: :show do
  link_to 'Approve',  approve_admin_user_path(user), method: :put if !user.approved?
  end
  
  member_action :approve, method: :put do
    user = User.find(params[:id])
    user.update(approved: true)
    redirect_to admin_users_path
  end

end
